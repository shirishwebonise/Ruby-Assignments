require 'roman_number'

RSpec.describe RomanNumber do
  context "when roman number is converted to decimal notation" do
    def create_roman_number(roman_number_string)
      RomanNumber.new roman_number_string
    end

    it "converts single roman number I" do
      roman_number = create_roman_number 'I'
      expect(roman_number.decimal_value).to eq 1
    end

    it "converts single roman number V" do
      roman_number = create_roman_number 'V'
      expect(roman_number.decimal_value).to eq 5
    end

    it "converts single roman number X" do
      roman_number = create_roman_number 'X'
      expect(roman_number.decimal_value).to eq 10
    end

    it "converts single roman number L" do
      roman_number = create_roman_number 'L'
      expect(roman_number.decimal_value).to eq 50
    end

    it "converts single roman number C" do
      roman_number = create_roman_number 'C'
      expect(roman_number.decimal_value).to eq 100
    end

    it "converts single roman number D" do
      roman_number = create_roman_number 'D'
      expect(roman_number.decimal_value).to eq 500
    end

    it "converts single roman number M" do
      roman_number = create_roman_number 'M'
      expect(roman_number.decimal_value).to eq 1000
    end

    it "converts roman number with type: first less than second" do
      roman_number = create_roman_number 'IV'
      expect(roman_number.decimal_value).to eq 4
    end

    it "converts roman number with type: first more than second" do
      roman_number = create_roman_number 'XI'
      expect(roman_number.decimal_value).to eq 11
    end

    it "converts a large roman number" do
      roman_number = create_roman_number 'MCMLXXXIV'
      expect(roman_number.decimal_value).to eq 1984
    end

    it "raises exception for invalid representation" do
      expect{ create_roman_number 'HXI' }.to raise_error(ArgumentError)
    end
  end
end
