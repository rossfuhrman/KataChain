require 'greed'
describe "Greed" do
  before(:each) do
    @greed = Greed.new
  end
  it "should score 0 for no points" do
    @greed.dice_bag = [2,2,3,4,6]
    @greed.score.should eq 0
  end
  it "should score 100 for a single 1" do
    @greed.dice_bag = [1,2,3,4,6]
    @greed.score.should eq 100
  end
  it "should score 50 for a single 5" do
    @greed.dice_bag = [5,2,3,4,6]
    @greed.score.should eq 50
  end
  it "should score 1000 for triple 1s" do
    @greed.dice_bag = [1,1,1,2,3]
    @greed.score.should eq 1000
  end
  it "should score 200 for triple 2s" do
    @greed.dice_bag = [2,2,2,3,4]
    @greed.score.should eq 200
  end
  it "should score 300 for triple 3s" do
    @greed.dice_bag = [3,3,3,2,4]
    @greed.score.should eq 300
  end
  it "should score 400 for triple 4s" do
    @greed.dice_bag = [4,4,4,2,3]
    @greed.score.should eq 400
  end
  it "should score 500 for triple 5s" do
    @greed.dice_bag = [5,5,5,2,3]
    @greed.score.should eq 500
  end
  it "should score 600 for triple 6s" do
    @greed.dice_bag = [6,6,6,2,3]
    @greed.score.should eq 600
  end
  it "scores correctly for various test cases" do
    @greed.dice_bag = [2,2,2,1,5]
    @greed.score.should eq 350

    @greed.dice_bag = [1,1,1,5,1] 
    @greed.score.should eq 1150

    @greed.dice_bag = [2,3,4,6,2] 
    @greed.score.should eq 0

    @greed.dice_bag = [3,4,5,3,3] 
    @greed.score.should eq 350

    @greed.dice_bag = [1,5,1,2,4]
    @greed.score.should eq 250

    @greed.dice_bag = [5,5,5,5,5] 
    @greed.score.should eq 600
  end
end
