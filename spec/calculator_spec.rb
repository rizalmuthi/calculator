# frozen_string_literal: true

require '././lib/calculator'

describe Calculator do
  let(:start_deposit) { 10_000 }
  let(:interest_rate) { 1.10 }
  let(:investment_term) { 3 }
  let(:interest_paid_type) { :at_maturity }

  let(:calculator) do
    described_class.new(
      start_deposit: start_deposit,
      interest_rate: interest_rate,
      investment_term: investment_term,
      interest_paid_type: interest_paid_type
    )
  end

  describe "#run" do
    it "returns the expected result from given example" do
      expect(calculator.run).to eq(10_330)
    end

    context "when the input is invalid" do
      context "and start deposit is not positive number" do
        let(:start_deposit) { -100 }

        it "raises InvalidDepositError" do
          expect { calculator.run }.to raise_error InvalidDepositError
        end
      end

      context "and interest rate is not positive number" do
        let(:interest_rate) { -1.5 }

        it "raises InvalidInterestRateError" do
          expect { calculator.run }.to raise_error InvalidInterestRateError
        end
      end

      context "and investment term is not positive number" do
        let(:investment_term) { -10 }

        it "raises InvalidInvestmentTermRateError" do
          expect { calculator.run }.to raise_error InvalidInvestmentTermRateError
        end
      end

      context "and investment term is not whole number" do
        let(:investment_term) { 12.5 }

        it "raises InvalidInvestmentTermRateError" do
          expect { calculator.run }.to raise_error InvalidInvestmentTermRateError
        end
      end

      context "and interest paid type is not valid" do
        let(:interest_paid_type) { :something_else }

        it "raises InvalidInterestPaidTypeError" do
          expect { calculator.run }.to raise_error InvalidInterestPaidTypeError
        end
      end
    end
  end
end
