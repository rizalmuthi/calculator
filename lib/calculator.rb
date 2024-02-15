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

    periods.times do
      final_balance += final_balance * monthly_interest_rate(interest_rate_decimal)
    end

    final_balance.round(0)
  end

  def periods
    case interest_paid_type
    when :monthly then investment_term * 12
    when :quarterly then investment_term * 4
    when :annually then investment_term
    when :at_maturity then 1
    else
      raise InvalidInterestPaidTypeError.new(
        "Invalid Interest Paid Type. Must be one of: #{Validator::INTEREST_PAID_TYPE.join(" ")}"
      )
    end
  end

  def monthly_interest_rate(interest_rate_decimal)
    case interest_paid_type
    when :monthly then interest_rate_decimal / 12
    when :quarterly then interest_rate_decimal / 4
    when :annually then interest_rate_decimal
    when :at_maturity then interest_rate_decimal * investment_term
    else
      raise InvalidInterestPaidTypeError.new(
        "Invalid Interest Paid Type. Must be one of: #{Validator::INTEREST_PAID_TYPE.join(" ")}"
      )
    end
  end
end
