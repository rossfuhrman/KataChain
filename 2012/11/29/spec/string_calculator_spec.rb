require 'StringCalculator'
describe StringCalculator do
  before(:each) do
    @sc = StringCalculator.new
  end
  it "returns 0 for an empty string" do
    @sc.add("").should eq 0
  end
  it "returns the number for a single number" do
    @sc.add("1").should eq 1
    @sc.add("10").should eq 10
  end
  it "should add two numbers delimited by comma" do
    @sc.add("1,2").should eq 3
  end
  it "should add three numbers delimited by comma" do
    @sc.add("1,2,3").should eq 6
  end
  it "should add numbers delimited by newlines" do
    @sc.add("1\n2,3").should eq 6
    @sc.add("1\n2\n3").should eq 6
  end
  it "should support user specified delimetrs" do
    @sc.add("//;\n1;2,3").should eq 6
    @sc.add("//;\n1;2;3").should eq 6
  end
end
