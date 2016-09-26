
class RomanCodeEvaluator
  @@CODE = { coin: 'I', dollar: 'V', yen: 'X', rupee: 'L' }

  attr_reader :multiplicatives

  def initialize
    @multiplicatives = Hash.new
    eval_multiplicative("coin coin Silver 34")
    eval_multiplicative("coin dollar Gold 57800")
    eval_multiplicative("yen yen Iron 3910")
  end

  def evaluate(exp)
    roman_number = string_exp_to_roman_number(exp)
    roman_number.to_decimal
  end

  def multiplicative(key)
    @multiplicatives[key.to_sym]
  end

  private
    def string_exp_to_roman_number(exp)
      RomanNumber.new exp.split().map{ |key| @@CODE[key.to_sym] }.reduce(:+)
    end

    def eval_multiplicative(exp)
      roman_expression = ""
      exp_array = exp.split()
      exp_array.each do |elem|
        break if /[A-Z]+[a-z]*/.match(elem)
        roman_expression += @@CODE[elem.to_sym]
      end
      roman_number = RomanNumber.new roman_expression
      @multiplicatives[exp_array[-2].to_sym] = (exp_array[-1].to_f) / roman_number.to_decimal
    end
end
