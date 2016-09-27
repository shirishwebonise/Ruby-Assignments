require 'roman_code'

RSpec.describe RomanCode do
  context "when value of a key is asked" do
    let(:roman_code) { RomanCode.new }

    it "raises an error if the key is not present" do
      expect{ roman_code.value_of('jewel') }.to raise_error(ArgumentError)
    end

    it "returns the value of a key" do
      expect(roman_code.value_of('coin')).to eq("I")
      expect(roman_code.value_of('dollar')).to eq("V")
      expect(roman_code.value_of('yen')).to eq("X")
      expect(roman_code.value_of('rupee')).to eq("L")
    end
  end
end
