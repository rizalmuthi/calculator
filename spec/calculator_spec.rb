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

    context "when the interest_paid_type is monthly" do
      let(:interest_paid_type) { :monthly }

      context "and the interest_rate is 2.5%" do
        context "with investment_term is 1" do
          let(:interest_rate) { 2.5 }
          let(:investment_term) { 1 }

          it "returns the same number as compared to the Bendigo Bank calculator" do
            expect(calculator.run).to eq(10_253)
          end
        end
      end

      context "and the interest_rate is 5%" do
        context "with investment_term is 5" do
          let(:interest_rate) { 5 }
          let(:investment_term) { 5 }

          it "returns the same number as compared to the Bendigo Bank calculator" do
            expect(calculator.run).to eq(12_834)
          end
        end
      end
    end

    context "when the interest_paid_type is quarterly" do
      let(:interest_paid_type) { :quarterly }

      context "and the interest_rate is 2.5%" do
        context "with investment_term is 1" do
          let(:interest_rate) { 2.5 }
          let(:investment_term) { 1 }

          it "returns the same number as compared to the Bendigo Bank calculator" do
            expect(calculator.run).to eq(10_252)
          end
        end
      end

      context "and the interest_rate is 5%" do
        context "with investment_term is 5" do
          let(:interest_rate) { 5 }
          let(:investment_term) { 5 }

          it "returns the same number as compared to the Bendigo Bank calculator" do
            expect(calculator.run).to eq(12_820)
          end
        end
      end
    end

    context "when the interest_paid_type is annually" do
      let(:interest_paid_type) { :annually }

      context "and the interest_rate is 2.5%" do
        context "with investment_term is 1" do
          let(:interest_rate) { 2.5 }
          let(:investment_term) { 1 }

          it "returns the same number as compared to the Bendigo Bank calculator" do
            expect(calculator.run).to eq(10_250)
          end
        end
      end

      context "and the interest_rate is 5%" do
        context "with investment_term is 5" do
          let(:interest_rate) { 5 }
          let(:investment_term) { 5 }

          it "returns the same number as compared to the Bendigo Bank calculator" do
            expect(calculator.run).to eq(12_763)
          end
        end
      end
    end

    context "when the interest_paid_type is at_maturity" do
      let(:interest_paid_type) { :at_maturity }

      context "and the interest_rate is 2.5%" do
        context "with investment_term is 1" do
          let(:interest_rate) { 2.5 }
          let(:investment_term) { 1 }

          it "returns the same number as compared to the Bendigo Bank calculator" do
            expect(calculator.run).to eq(10_250)
          end
        end
      end

      context "and the interest_rate is 5%" do
        context "with investment_term is 5" do
          let(:interest_rate) { 5 }
          let(:investment_term) { 5 }

          it "returns the same number as compared to the Bendigo Bank calculator" do
            expect(calculator.run).to eq(12_500)
          end
        end
      end
    end
  end
end
