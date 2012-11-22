class PrimeFactors
  def generate(input)
    find_prime(input)
  end
  def find_prime(input)
    arr = []
    i = input - 1
    while i > 1 do
      if input % i == 0
        result = input / i
        arr << result if result > 1
        find_prime(i).each do |number|
          arr << number
        end
        return arr
      end
      i -= 1
    end
    [input]
  end
end
