require 'cart.rb'

describe 'Cart' do
  before(:each) do
    @cart = Cart.new
  end
  it "should calculate the cost of buying an item" do
    @cart.add_item("Bread")
    @cart.total.should eq 1
  end
  it "should calculate the cost of buying many items" do
    @cart.add_item("Bread")
    @cart.add_item("Bread")
    @cart.add_item("Noodles")
    @cart.add_item("Soup")
    @cart.total.should eq 4.5
  end
  it "should print out the cost of each item" do
    @cart.add_item("Bread")
    @cart.add_item("Noodles")
    @cart.print.should eq "Bread * 1 = 1.00\nNoodles * 1 = 0.50\nTotal = 1.50"
  end
  it "should print out the cost for quantities of an item" do
    @cart.add_item("Bread")
    @cart.add_item("Bread")
    @cart.add_item("Noodles")
    @cart.add_item("Noodles")
    @cart.print.should eq "Bread * 2 = 2.00\nNoodles * 2 = 1.00\nTotal = 3.00"
  end
  it "should calculate the cost of buying produce" do
    @cart.add_produce("Apples", 1.5)
    @cart.total.should eq 3.00
  end
  it "should calculate the cost of buying produce and items" do
    @cart.add_produce("Apples", 1.5)
    @cart.add_item("Bread")
    @cart.total.should eq 4.00
  end
  it "should print out the cost for produce" do
    @cart.add_produce("Apples", 1.5)
    @cart.print.should eq "Apples * 1.5lbs = 3.00\nTotal = 3.00"
  end
end

