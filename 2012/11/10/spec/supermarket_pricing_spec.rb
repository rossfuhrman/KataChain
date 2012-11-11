require 'cart.rb'

describe "Cart" do
  before(:each) do
    @cart = Cart.new
  end
  it "should give the total of buying one item" do
    @cart.add_item("Bread")
    @cart.total.should eq 1
  end
  it "should give the total of buying many items" do
    @cart.add_item("Bread")
    @cart.add_item("Noodles")
    @cart.add_item("Soup")
    @cart.total.should eq 3.5
  end
  it "should give the total of buying many of the same item" do
    @cart.add_item("Bread")
    @cart.add_item("Bread")
    @cart.add_item("Bread")
    @cart.total.should eq 3
  end
  it "should print the cost of each item" do
    @cart.add_item("Bread")
    @cart.add_item("Noodles")
    @cart.print.should eq "Bread * 1 = 1.00\nNoodles * 1 = 0.50\n"
  end
  it "should print the cost of each item on one line" do
    @cart.add_item("Bread")
    @cart.add_item("Bread")
    @cart.add_item("Noodles")
    @cart.add_item("Noodles")
    @cart.print.should eq "Bread * 2 = 2.00\nNoodles * 2 = 1.00\n"
  end
  it "should give the total for buying produce" do
    @cart.add_produce("Apples", 1.5)
    @cart.total.should eq 3
  end
  it "should print the cost of produce" do
    @cart.add_produce("Apples", 1.5)
    @cart.print.should eq "Apples * 1.5lbs = 3.00\n"
  end
end
