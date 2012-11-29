class FizzBuzz
  def calculate(input)
    return "FizzBuzz" if input % (3 * 5) == 0
    return "Fizz" if input % 3 == 0
    return "Buzz" if input % 5 == 0
    input
  end
end
