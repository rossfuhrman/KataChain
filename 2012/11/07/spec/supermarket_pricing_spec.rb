require "cart.rb"
describe "Cart" do
  before(:each) do
    @cart = Cart.new
  end
  it "should give the total for one item" do
    @cart.add_item("Bread")
    @cart.total.should eq 1
  end
  it "should give the total for many items" do
    @cart.add_item("Bread")
    @cart.add_item("Noodles")
    @cart.add_item("Soup")
    @cart.total.should eq 3.5
  end
  it "should support quantities" do
    @cart.add_item("Bread")
    @cart.add_item("Bread")
    @cart.add_item("Bread")
    @cart.total.should eq 3
  end
  it "should print out the cost of each item" do
    @cart.add_item("Bread")
    @cart.add_item("Noodles")
    @cart.add_item("Noodles")
    @cart.add_item("Soup")
    @cart.add_item("Soup")
    @cart.add_item("Soup")
    @cart.print_line_items.should eq "Bread * 1 = 1.00\nNoodles * 2 = 1.00\nSoup * 3 = 6.00\n"
  end
  it "should handle total produce" do
    @cart.add_produce("Apples", 1.5)
    @cart.total.should eq 3
  end
  it "should handle total regular items and produce" do
    @cart.add_item("Bread")
    @cart.add_produce("Apples", 1.5)
    @cart.total.should eq 4
  end
  it "should print out the cost of produce" do
    @cart.add_produce("Apples", 1.5)
    @cart.print_line_items.should eq "Apples $2/lbs * 1.5 lbs = 3.00\n"
  end
  it "should print out the cost of items and produce" do
    @cart.add_item("Bread")
    @cart.add_produce("Apples", 1.5)
    @cart.print_line_items.should eq "Bread * 1 = 1.00\nApples $2/lbs * 1.5 lbs = 3.00\n"
  end
end

