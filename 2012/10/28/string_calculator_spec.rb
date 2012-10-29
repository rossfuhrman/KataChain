require 'minitest/autorun'

class TestStringCalculator < MiniTest::Unit::TestCase
  def setup
    @sc = StringCalculator.new
  end
  def test_empty_string
    assert_equal 0, @sc.calculate("")
  end
  def test_single_number
    assert_equal 1, @sc.calculate("1")
  end
  def test_two_numbers
    assert_equal 3, @sc.calculate("1,2")
  end
  def test_three_numbers
    assert_equal 6, @sc.calculate("1,2,3")
  end
  def test_handles_newline_character
    assert_equal 6, @sc.calculate("1\n2,3")
    assert_equal 6, @sc.calculate("1\n2\n3")
  end
  def test_specify_delimeter
    assert_equal 3, @sc.calculate("//;\n1;2")
    assert_equal 6, @sc.calculate("//;\n1;2;3")
  end
end

class StringCalculator

  def calculate input
    return 0 if input == ""
    input = normalize input
    input = sum input
  end

  def normalize input
    input = change_delimeter_if_specified input
    input = input.gsub "\n", ","
  end

  def sum input
    if input.include? ","
      array = input.split ","
      return array.inject{|sum,value| sum.to_i + value.to_i}
    end
    input.to_i
  end

  def change_delimeter_if_specified input
    if input[0,2] == "//"
      delimeter = input[2]
      input = input[4,input.length]
      input = input.gsub delimeter, ","
    end
    input
  end

end
