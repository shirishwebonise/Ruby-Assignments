require 'roman_code'

class RomanCodeEvaluator
  attr_reader :multiplicatives

  def initialize
    @code = RomanCode.new
  end

  def eval_exp(exp)
    roman_number = string_exp_to_roman_number(exp)
    roman_number.decimal_value
  end

  def eval_multiplicative(exp)
    roman_expression = ""
    exp_array = exp.split()
    exp_array.each do |elem|
      break if /[A-Z]+[a-z]*/.match(elem)
      roman_expression += @code.value_of(elem)
    end
    roman_number = RomanNumber.new roman_expression
    (exp_array[-1].to_f) / roman_number.decimal_value
  end

  private
    def string_exp_to_roman_number(exp)
      RomanNumber.new exp.split().map{ |key| @code.value_of(key) }.reduce(:+)
    end
end
