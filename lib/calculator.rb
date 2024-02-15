# frozen_string_literal: true

class InvalidDepositError < StandardError; end
class InvalidInterestRateError < StandardError; end
class InvalidInvestmentTermRateError < StandardError; end
class InvalidInterestPaidTypeError < StandardError; end

class Calculator
  INTEREST_PAID_TYPE = [:monthly, :quarterly, :annually, :at_maturity]

  def initialize(start_deposit:, interest_rate:, investment_term:, interest_paid_type:)
    @start_deposit = start_deposit
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
    unless start_deposit.positive?
      raise InvalidDepositError.new("Start Deposit must be positive number")
    end

    unless interest_rate.positive?
      raise InvalidInterestRateError.new("Interest Rate must be positive number")
    end

    unless investment_term.positive?
      raise InvalidInvestmentTermRateError.new("Investment Term must be positive number")
    end

    unless investment_term.integer?
      raise InvalidInvestmentTermRateError.new("Investment Term must be whole number. Ex: 12")
    end

    unless INTEREST_PAID_TYPE.include?(interest_paid_type)
      raise InvalidInterestPaidTypeError.new(
        "Invalid Interest Paid Type. Must be one of: #{INTEREST_PAID_TYPE.join(" ")}"
      )
    end
  end

  def calculate
  end
end
