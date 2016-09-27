
class RomanNumber
  @@MAPPINGS = { M: 1000, D: 500, C: 100, L: 50, X:10, V: 5, I: 1 }
  attr_reader :number_str
  alias_method :as_string, :number_str

  def initialize(number_str)
    raise ArgumentError, "Invalid Roman Number" if /[^MDCLXVI]/.match(number_str)
    @number_str = number_str
  end

  def decimal_value
    evaluate_to_decimal
  end

  private
    def decimal(roman)
      return 0 if roman.nil?
      @@MAPPINGS[roman.to_sym]
    end

    def evaluate_to_decimal
      converted_num = 0
      last_decimal = 0
      @number_str.split('').reverse.each do |element|
        element_decimal = decimal(element)
        if( last_decimal > element_decimal)
          converted_num -= element_decimal
        else
          converted_num += element_decimal
        end
        last_decimal = element_decimal
      end
      converted_num
    end
end
