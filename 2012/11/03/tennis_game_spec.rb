require 'minitest/autorun'

class TestTennisGame < MiniTest::Unit::TestCase
  def setup
    @alice = Player.new("Alice")
    @bob = Player.new("Bob")
  end
  def test_player_starts_with_zero_points
    assert_equal 0, @alice.point_total
  end
  def test_player_can_score_points
    @alice.score_point
    assert_equal 1, @alice.point_total
  end
  def test_can_determine_winner_of_game
   assert_equal false, Game.has_winner?(@alice, @bob)
   4.times do
    @alice.score_point
   end
   assert_equal true, Game.has_winner?(@alice, @bob)
  end
  def test_must_win_by_two
   4.times do
    @alice.score_point
    @bob.score_point
   end
   assert_equal false, Game.has_winner?(@alice, @bob)
   @alice.score_point
   assert_equal false, Game.has_winner?(@alice, @bob)
   @alice.score_point
   assert_equal true, Game.has_winner?(@alice, @bob)
  end
  def test_return_message_when_there_is_no_winner
    assert_equal "No winner yet.", Game.who_won(@alice, @bob)
  end
  def test_determine_winner
   4.times do
    @alice.score_point
   end
   assert_equal "Alice", Game.who_won(@alice, @bob)
  end
  def test_return_tennis_score
    assert_equal 0, @alice.tennis_score
    @alice.score_point
    assert_equal 15, @alice.tennis_score
    @alice.score_point
    assert_equal 30, @alice.tennis_score
    @alice.score_point
    assert_equal 40, @alice.tennis_score
    @alice.score_point
    assert_equal "Deuce", @alice.tennis_score
  end
end

class Player
  attr_reader :point_total, :name
  def initialize(name)
    @name = name
    @point_total = 0
  end
  def score_point
    @point_total += 1
  end
  def tennis_score
    tennis_scoring_sequence[@point_total]
  end
  def tennis_scoring_sequence
    Array.[](0,15,30,40,"Deuce")
  end
end

class Game
  def self.who_won(player1, player2)
    if has_winner?(player1, player2)
      return player1.point_total > player2.point_total ? player1.name : player2.name
    end
    "No winner yet."
  end
  def self.has_winner?(player1, player2)
    return true if one_player_has_four_points(player1, player2) && has_two_point_lead(player1, player2)
    false
  end
  def self.one_player_has_four_points(player1, player2)
    player1.point_total > 3 || player2.point_total > 3
  end
  def self.has_two_point_lead(player1, player2)
    (player1.point_total - player2.point_total).abs > 1
  end
end
