require 'cart.rb'

describe "Cart" do
  before(:each) do
    @cart = Cart.new
  end
  it "calculates the cost of buying an item" do
    @cart.add_item("Bread")
    @cart.total.should eq 1
  end
  it "calculates the cost of buying many items" do
    @cart.add_item("Bread")
    @cart.add_item("Bread")
    @cart.add_item("Noodles")
    @cart.total.should eq 2.5
  end
  it "prints out cost of each item" do
    @cart.add_item("Bread")
    @cart.add_item("Bread")
    @cart.add_item("Noodles")
    @cart.print.should eq "Bread = 1.00\nBread = 1.00\nNoodles = 0.50\n"
  end
  it "calculates the cost of buying produce" do
    @cart.add_produce("Apples", 1.5)
    @cart.total.should eq 3
  end
  it "prints out the cost of buying produce" do
    @cart.add_produce("Apples", 1.5)
    @cart.print.should eq "Apples 1.5 * 2.00/lb = 3.00\n"
  end
end
