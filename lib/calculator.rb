# frozen_string_literal: true
require 'bigdecimal'
require_relative 'validator'

class Calculator
  def initialize(start_deposit:, interest_rate:, investment_term:, interest_paid_type:)
    @start_deposit = BigDecimal(start_deposit)
    @interest_rate = interest_rate
    @investment_term = investment_term
    @interest_paid_type = interest_paid_type
  end

  def run
    validate
    calculate
  end

  private

  attr_reader :start_deposit, :interest_rate, :investment_term, :interest_paid_type

  def validate
    Validator.new(
      start_deposit: start_deposit,
      interest_rate: interest_rate,
      investment_term: investment_term,
      interest_paid_type: interest_paid_type
    ).run
  end

  def calculate
    final_balance = start_deposit
    interest_rate_decimal = interest_rate / 100.0

    case interest_paid_type
    when :monthly
      periods = investment_term * 12
      monthly_interest_rate = interest_rate_decimal / 12
      periods.times do
        final_balance += final_balance * monthly_interest_rate
      end
    when :quarterly
      periods = investment_term * 4
      quarterly_interest_rate = interest_rate_decimal / 4
      periods.times do
        final_balance += final_balance * quarterly_interest_rate
      end
    when :annually
      periods = investment_term
      periods.times do
        final_balance += final_balance * interest_rate_decimal
      end
    when :at_maturity
      final_balance += final_balance * (interest_rate_decimal * investment_term)
    else
      raise InvalidInterestPaidTypeError.new(
        "Invalid Interest Paid Type. Must be one of: #{Validator::INTEREST_PAID_TYPE.join(" ")}"
      )
    end

    final_balance.round(0)
  end
end
