require 'minitest/autorun'

class StringCalculatorSpec < MiniTest::Unit::TestCase
  def setup
    @string_calculator = StringCalculator.new
  end
  def test_empty_string
    assert_equal 0, @string_calculator.calculate("")
  end
  def test_single_number
    assert_equal 1, @string_calculator.calculate("1")
  end
  def test_two_numbers
    assert_equal 3, @string_calculator.calculate("1,2")
  end
  def test_three_numbers
    assert_equal 6, @string_calculator.calculate("1,2,3")
  end
  def test_handles_newlines
    assert_equal 3, @string_calculator.calculate("1\n2")
    assert_equal 6, @string_calculator.calculate("1\n2\n3")
  end
  def test_specify_delimeter
    assert_equal 3, @string_calculator.calculate("//;\n1;2")
    assert_equal 6, @string_calculator.calculate("//;\n1;2;3")
  end
end

class StringCalculator
  def calculate(input)
    input = normalize_delimeters(input)
    sum(input)
  end
  def normalize_delimeters(input)
    if input[0,2] == "//"
      delimeter = input[2]
      input = input[4,input.length-4]
      input = input.gsub(delimeter,",")
    end
    input = input.gsub("\n", ",")
  end
  def sum(input)
    array = input.split(",")
    array.inject{|sum,value| sum.to_i + value.to_i}.to_i
  end
end
