class PrimeFactors
  def generate(input)
    get_prime_factors(input)
  end
  def get_prime_factors(input)
    i = input - 1
    factors = []
    while i > 1
      if input % i == 0
        factors << input / i
        get_prime_factors(i).each do |factor|
          factors << factor
        end
        return factors
      end
      i -= 1
    end
    factors << input
  end
end
