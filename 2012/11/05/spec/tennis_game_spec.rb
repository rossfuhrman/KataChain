require 'player'
require 'game'

describe Player do
  before(:each) do
    @player = Player.new("")
  end
  it "should start with zero points" do
    0.should eq @player.point_total
  end
  it "should be able to score points" do
    @player.score_point
    1.should eq @player.point_total
  end
  it "should give tennis score based on point total" do
    0.should eq @player.tennis_score
    @player.score_point
    15.should eq @player.tennis_score
    @player.score_point
    30.should eq @player.tennis_score
    @player.score_point
    40.should eq @player.tennis_score
    @player.score_point
    "Deuce".should eq @player.tennis_score
    @player.score_point
    "Deuce".should eq @player.tennis_score
  end
end

describe Game do
  before(:each) do
    @alice = Player.new("Alice")
    @bob = Player.new("Bob")
  end
  it "can be completed with a winner" do
    4.times do
      @alice.score_point
    end
    true.should eq Game.has_winner?(@alice, @bob)
  end
  it "has no winner before a player scores 4 times" do
    false.should eq Game.has_winner?(@alice, @bob)
    3.times do
      @alice.score_point
    end
    false.should eq Game.has_winner?(@alice, @bob)
  end
  it "has to be won by two" do
    4.times do
      @alice.score_point
      @bob.score_point
    end
    false.should eq Game.has_winner?(@alice, @bob)
  end
  it "can determine a winner" do
    4.times do
      @alice.score_point
    end
    "Alice".should eq Game.who_won(@alice, @bob)
  end
  it "returns notification if there is no winner yet" do
    "No winner yet.".should eq Game.who_won(@alice, @bob)
  end
end

