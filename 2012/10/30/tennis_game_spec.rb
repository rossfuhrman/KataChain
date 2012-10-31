require 'minitest/autorun'

class TestTennisGame < MiniTest::Unit::TestCase
  def setup
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
  end
  def test_player_starts_with_zero
    assert_equal 0, @player1.point_total
    assert_equal 0, @player2.point_total
  end
  def test_player_can_score
    @player1.score
    assert_equal 1, @player1.point_total
  end
  def test_player_wins_after_four_straight_scores
    3.times do 
      @player1.score 
    end
    assert_equal "No Winner Yet", Game.winner(@player1, @player2)

    @player1.score

    assert_equal "Player 1", Game.winner(@player1, @player2)
    assert_equal "Player 1", Game.winner(@player2, @player1)
  end
  def test_player_has_to_win_by_two
    3.times do
      @player1.score
      @player2.score
    end
    assert_equal "No Winner Yet", Game.winner(@player1, @player2)
    @player1.score
    assert_equal "No Winner Yet", Game.winner(@player1, @player2)
    assert_equal "No Winner Yet", Game.winner(@player2, @player1)
    @player1.score
    assert_equal "Player 1", Game.winner(@player1, @player2)
  end
  def test_tennis_scoring
    assert_equal 0, @player1.tennis_score
    @player1.score
    assert_equal 15, @player1.tennis_score
    @player1.score
    assert_equal 30, @player1.tennis_score
    @player1.score
    assert_equal 40, @player1.tennis_score
    @player1.score
    assert_equal "Deuce", @player1.tennis_score
  end
end

class Player
  attr_reader :point_total, :name
  def initialize(name)
    @name = name
    @point_total = 0
  end
  def score
    @point_total += 1
  end
  def tennis_score
    crazy_tennis_point_scale[point_total]
  end
  def crazy_tennis_point_scale
    Array.[](0,15,30,40,"Deuce")
  end
end

class Game
  def self.winner(player1, player2)
    return player1.name if player1.point_total > 3 && (player1.point_total - player2.point_total > 1)
    return player2.name if player2.point_total > 3 && (player2.point_total - player1.point_total > 1)
    "No Winner Yet"
  end
end
