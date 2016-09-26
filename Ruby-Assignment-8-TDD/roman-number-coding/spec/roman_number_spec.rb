require 'roman_number'

RSpec.describe RomanNumber do
  context "when roman number is converted to decimal notaion" do
    def create_roman_number(roman_number_string)
      RomanNumber.new roman_number_string
    end

    it "converts roman number with single letter" do
      roman_number = create_roman_number 'X'
      expect(roman_number.to_decimal).to eq 10
    end

    it "converts roman number with type: first less than second" do
      roman_number = create_roman_number 'IV'
      expect(roman_number.to_decimal).to eq 4
    end

    it "converts roman number with type: first more than second" do
      roman_number = create_roman_number 'XI'
      expect(roman_number.to_decimal).to eq 11
    end

    it "returns 0 for invalid representation" do
      roman_number = create_roman_number 'HJK'
      expect(roman_number.to_decimal).to eq 0
    end
  end
end
