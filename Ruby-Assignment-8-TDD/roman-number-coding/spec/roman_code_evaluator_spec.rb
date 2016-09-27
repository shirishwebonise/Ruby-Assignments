require 'roman_code_evaluator'

RSpec.describe RomanCodeEvaluator do
  let(:code_evaluator) { RomanCodeEvaluator.new }

  context "after RomanCodeEvaluator is instantiated" do
    it "evaluates multiplicatives" do
      expect(code_evaluator.eval_multiplicative("coin coin Silver 34")).to eq 17
      expect(code_evaluator.eval_multiplicative("coin dollar Gold 57800")).to eq 14450
      expect(code_evaluator.eval_multiplicative("yen yen Iron 3910")).to eq 195.5
    end

    it "evaluates expression" do
      result = code_evaluator.eval_exp 'yen rupee coin coin'
      expect(result).to eq 42
    end
  end
end
