require 'roman-numerals'

class RomanNumber
  attr_reader :number_str
  alias_method :as_string, :number_str

  def initialize(number_str)
    @number_str = number_str
  end

  def to_decimal
    RomanNumerals.to_decimal(@number_str)
  end
end
