require 'potter'
describe Potter do
  it "applies the discounts for buying single copies of the books" do
    potter = Potter.new
    potter.add_book('a')
    potter.total.should eq 8.0
    potter.add_book('b')
    potter.total.should eq 15.2
    potter.add_book('c')
    potter.total.should eq 21.6
    potter.add_book('d')
    potter.add_book('e')
    potter.add_book('f')
    potter.add_book('g')
    potter.total.should eq 36.4
  end
  it "doesn't give discounts for buying multiple copies of a book" do
    potter = Potter.new
    potter.add_book('a')
    potter.total.should eq 8.0
    potter.add_book('a')
    potter.total.should eq 16.0
    potter.add_book('a')
    potter.total.should eq 24.0
  end
  it "apply discounts on 2 sets of 2 books" do
    potter = Potter.new
    potter.add_book('a')
    potter.add_book('a')
    potter.add_book('b')
    potter.add_book('b')
    potter.total.should eq 30.4
  end
end
