# frozen_string_literal: true

require_relative 'lib/calculator'
require_relative 'lib/validator'

puts "### Welcome to Term Deoposit Calculator ###"
puts

puts "Enter Deposit Amount (must be positive number, Ex: 10000):"
start_deposit = gets

puts "Enter the interest rate per year (Ex: 1.10%)"
interest_rate = gets.to_f

puts "Enter the investment term in years (must be positive and whole number Ex: 3):"
investment_term = gets.to_i

puts "Enter the interest paid type (1 = monthly, 2 = quarterly, 3 = annually, 4 = at maturity) :"
interest_type = gets.chomp.to_i


interest_types = Validator::INTEREST_PAID_TYPE
  .map
  .each_with_index { |val, key| [key+1, val] }
  .to_h

calculator = Calculator.new(
  start_deposit: start_deposit,
  interest_rate: interest_rate,
  investment_term: investment_term,
  interest_paid_type: interest_types.fetch(interest_type, :error_type)
)

result = calculator.run
puts
puts "Your Final balance: $#{result}"
puts "Thank you"
