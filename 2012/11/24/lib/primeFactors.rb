class PrimeFactors
  def generate(input)
    get_prime_factors(input)
  end
  def get_prime_factors(input)
    i = input - 1
    prime_factors = []
    while i > 1
      if input % i == 0
        prime_factors << input / i
        get_prime_factors(i).each { |factor| prime_factors << factor }
        return prime_factors
      end
      i -= 1
    end
    [input]
  end
end
