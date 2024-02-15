# frozen_string_literal: true

require '././lib/calculator'

describe Calculator do
  let(:calculator) { described_class.new }

  describe "#run" do
    it "returns the expected result from given example" do
      expect(calculator.run).to eq(10_330)
    end
  end
end
