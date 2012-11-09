require 'cart.rb'

describe "Cart" do
  before(:each) do
    @cart = Cart.new
  end
  it "should give the cost of buying one product" do
    @cart.add_item("Bread")
    @cart.total.should eq 1
  end
  it "should give the cost of buying many product" do
    @cart.add_item("Bread")
    @cart.add_item("Noodles")
    @cart.add_item("Soup")
    @cart.total.should eq 3.5
  end
  it "should give the cost of buying products and produce" do
    @cart.add_item("Bread")
    @cart.add_produce("Apples", 1.5)
    @cart.total.should eq 4
  end
  it "should give the cost of buying many of the same product" do
    @cart.add_item("Bread")
    @cart.add_item("Bread")
    @cart.add_item("Bread")
    @cart.total.should eq 3
  end
  it "should print out the cost of purchased items" do
    @cart.add_item("Bread")
    @cart.add_item("Noodles")
    @cart.print.should eq "Bread * 1 = 1.00\nNoodles * 1 = 0.50\n"
  end
  it "should print out quantity" do
    @cart.add_item("Bread")
    @cart.add_item("Bread")
    @cart.print.should eq "Bread * 2 = 2.00\n"
  end
  it "should sell produce by weight" do
    @cart.add_produce("Apples", 1.5)
    @cart.print.should eq "Apples * 1.5lbs = 3.00\n"
  end
end
