require 'roman_code_evaluator'

RSpec.describe RomanCodeEvaluator do
  let(:code_evaluator) { RomanCodeEvaluator.new }

  context "when RomanCodeEvaluator is instantiated" do
    it "evaluates multiplicatives" do
      expect(code_evaluator.multiplicative("Silver")).to eq 17
      expect(code_evaluator.multiplicative("Gold")).to eq 14450
      expect(code_evaluator.multiplicative("Iron")).to eq 195.5
    end
  end

  context "when code is evaluated" do
    it "gives result of evaluated code" do
      result = code_evaluator.evaluate 'yen rupee coin coin'
      expect(result).to eq 42
    end
  end
end
