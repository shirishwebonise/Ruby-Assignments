
class RomanCode
  def initialize
    @code = { coin: 'I', dollar: 'V', yen: 'X', rupee: 'L' }
  end

  def value_of(key)
    raise ArgumentError, "Code doesn't contain the key: #{key}" if !@code.key?(key.to_sym)
    @code[key.to_sym]
  end
end
