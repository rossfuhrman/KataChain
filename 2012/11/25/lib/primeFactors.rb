class PrimeFactors
  def generate(input)
    get_prime_factors(input)
  end
  def get_prime_factors(input)
    prime_factors = []
    i = input - 1
    while i > 1
      if input % i == 0 
        prime_factors << input / i
        get_prime_factors(i).each do |factor|
          prime_factors << factor
        end
        return prime_factors
      end
      i -= 1
    end
    [input]
  end
end
