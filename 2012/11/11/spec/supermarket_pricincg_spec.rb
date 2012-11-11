require 'cart.rb'
describe "Cart" do
  before(:each) do
    @cart = Cart.new
  end
  it "should return the total for a single item" do
    @cart.add_item("Bread")
    @cart.total.should eq 1
  end
  it "should return the total for many items" do
    @cart.add_item("Bread")
    @cart.add_item("Noodles")
    @cart.add_item("Soup")
    @cart.total.should eq 3.5
  end
  it "should return the total when buying many of the same item" do
    @cart.add_item("Bread")
    @cart.add_item("Bread")
    @cart.add_item("Bread")
    @cart.total.should eq 3
  end
  it "should print out the cost of the items" do
    @cart.add_item("Bread")
    @cart.add_item("Noodles")
    @cart.print.should eq "Bread = 1.00\nNoodles = 0.50\n"
  end
  it "should print out multiple quantities of an item on separate lines" do
    @cart.add_item("Bread")
    @cart.add_item("Bread")
    @cart.add_item("Bread")
    @cart.print.should eq "Bread = 1.00\nBread = 1.00\nBread = 1.00\n"
  end
  it "should return the total for buying produce" do
    @cart.add_produce("Apples", 1.5)
    @cart.total.should eq 3
  end
  it "should print out the cost of buying produce" do
    @cart.add_produce("Apples", 1.5)
    @cart.print.should eq "Apples * 1.5lbs = 3.00\n"
  end
end
