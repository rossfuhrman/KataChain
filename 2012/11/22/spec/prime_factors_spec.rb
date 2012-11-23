require 'primeFactors'
describe "PrimeFactors" do
  it "should generate array of prime factors for a given number" do
    prime_factors = PrimeFactors.new
    prime_factors.generate(2).should eq [2]
    prime_factors.generate(3).should eq [3]
    prime_factors.generate(4).should eq [2,2]
    prime_factors.generate(6).should eq [2,3]
    prime_factors.generate(8).should eq [2,2,2]
    prime_factors.generate(9).should eq [3,3]
    prime_factors.generate(10).should eq [2,5]
    prime_factors.generate(12).should eq [2,2,3]
  end
end
