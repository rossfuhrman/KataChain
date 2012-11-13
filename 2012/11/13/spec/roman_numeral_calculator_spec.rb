require 'roman_numeral_calculator.rb'
describe "RomanNumeralCalculator" do
  it "should return the Roman Numerals for a given integer" do
    rnc = RomanNumeralCalculator.new
    rnc.calculate(1).should eq "I"
    rnc.calculate(2).should eq "II"
    rnc.calculate(5).should eq "V"
    rnc.calculate(6).should eq "VI"
    rnc.calculate(10).should eq "X"
    rnc.calculate(4).should eq "IV"
    rnc.calculate(9).should eq "IX"
    rnc.calculate(20).should eq "XX"
    rnc.calculate(1953).should eq "MCMLIII"
    rnc.calculate(2549).should eq "MMDXLIX"
  end
end
