
class RomanNumber
  @@mappings = { M: 1000, D: 500, C: 100, L: 50, X:10, V: 5, I: 1 }
  attr_reader :number_str
  alias_method :as_string, :number_str

  def initialize(number_str)
    @number_str = number_str
  end

  def to_decimal
    converted_num = 0
    last_decimal = 0
    @number_str.split('').reverse.each do |element|
      element_decimal = decimal_value(element)
      return 0 if element_decimal.nil?

      if( last_decimal > element_decimal)
        converted_num -= element_decimal
      else
        converted_num += element_decimal
      end
      last_decimal = element_decimal
    end
    converted_num
  end

  private
    def decimal_value(roman)
      return 0 if roman.nil?
      @@mappings[roman.to_sym]
    end
end
