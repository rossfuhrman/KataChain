require 'cart'

describe Cart do
  before(:each) do
    @cart = Cart.new
  end
  it "should give the cost of buying one item" do
    @cart.add_item("Bread")
    1.should eq @cart.total
  end
  it "should give the cost of buying many items" do
    @cart.add_item("Bread")
    @cart.add_item("Noodles")
    @cart.add_item("Soup")
    3.5.should eq @cart.total
  end
  it "should total many quantities of the same item" do
    @cart.add_item("Bread")
    @cart.add_item("Bread")
    2.should eq @cart.total
  end
  it "should print out the cost of each item purchased" do
    @cart.add_item("Bread")
    @cart.add_item("Noodles")
    "Bread * 1 = 1.00\nNoodles * 1 = 0.50\n".should eq @cart.print_receipt
  end
  it "should print out the cost and quantity of multiple items" do
    @cart.add_item("Bread")
    @cart.add_item("Bread")
    @cart.add_item("Noodles")
    "Bread * 2 = 2.00\nNoodles * 1 = 0.50\n".should eq @cart.print_receipt
  end
  it "should print out the cost and weight of produce" do
    @cart.add_produce("Apple", 1.50)
    @cart.print_receipt.should eq "Apple - 1.5 lbs = 3.00\n"
  end
end
