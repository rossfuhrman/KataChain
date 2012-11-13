class RomanNumeralCalculator
  def calculate(input)
    output = ""
    roman_numeral_lookup.each do |key,value|
      while input >= key
        output << value
        input -= key
      end
    end
    output 
  end
  def roman_numeral_lookup
    {1000 => "M", 900 => "CM", 500 => "D", 400 => "CD", 100 => "C", 50 => "L", 40 => "XL", 10 => "X", 9 => "IX", 5 => "V", 4 => "IV", 1 => "I" }
  end
end
