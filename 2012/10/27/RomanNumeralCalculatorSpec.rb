require 'minitest/autorun'

class TestRomanNumeralCalculator < MiniTest::Unit::TestCase
  def test_roman_numeral_calculator
    @rnc = RomanNumeralCalculator.new
    assert_equal "I", @rnc.calculate(1)
    assert_equal "II", @rnc.calculate(2)
    assert_equal "V", @rnc.calculate(5)
    assert_equal "VI", @rnc.calculate(6)
    assert_equal "X", @rnc.calculate(10)
    assert_equal "IV", @rnc.calculate(4)
    assert_equal "MCMLIII", @rnc.calculate(1953)
    assert_equal "MMDXLIX", @rnc.calculate(2549)
  end
end

class RomanNumeralCalculator
  def lookup_hash
    {1000 => "M", 900 => "CM", 500 => "D", 400 => "CD", 100 => "C", 50 => "L", 40 => "XL", 10 => "X", 9 => "IX", 5 => "V", 4 => "IV", 1 => "I"}
  end

  def calculate(input)
    return_vaue = ""
    lookup_hash.each do |key, value| 
      while input >= key
        return_vaue << value
        input -= key
      end
    end
    return_vaue
  end
end
