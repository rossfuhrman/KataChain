require 'FizzBuzz'

describe FizzBuzz do
  before(:each) do
    @fizzBuzz = FizzBuzz.new
  end
  it "should return the number when not divisible by 3 or 5" do
    @fizzBuzz.calculate(1).should eq 1
    @fizzBuzz.calculate(2).should eq 2
  end
  it "should return Fizz when divisible by 3" do
    @fizzBuzz.calculate(3).should eq "Fizz"
  end
  it "should return Buzz when divisible by 5" do
    @fizzBuzz.calculate(5).should eq "Buzz"
  end
  it "should return FizzBuzz when divisible by 3 and 5" do
    @fizzBuzz.calculate(15).should eq "FizzBuzz"
  end
end
