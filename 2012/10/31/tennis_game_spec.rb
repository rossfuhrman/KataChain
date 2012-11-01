require 'minitest/autorun'

class TestTennisGame < MiniTest::Unit::TestCase
  def setup
    @player1 = Player.new("Bob Player1")
    @player2 = Player.new("Alice Player2")
  end
  def test_players_start_with_0_points
    assert_equal 0, @player1.point_total
  end
  def test_players_can_score_points
    @player1.score_point
    assert_equal 1, @player1.point_total
  end
  def test_player_can_win
    4.times do
      @player1.score_point
    end
    assert_equal "Bob Player1", Game.winner?(@player1, @player2)
  end
  def test_player_has_to_win_by_two
    4.times do
      @player1.score_point
      @player2.score_point
    end
    assert_equal "No winner yet", Game.winner?(@player1, @player2)
    @player1.score_point
    assert_equal "No winner yet", Game.winner?(@player1, @player2)
    @player1.score_point
    assert_equal "Bob Player1", Game.winner?(@player1, @player2)
  end
  def test_get_tennis_score
    assert_equal 0, @player1.tennis_score
    @player1.score_point
    assert_equal 15, @player1.tennis_score
    @player1.score_point
    assert_equal 30, @player1.tennis_score
    @player1.score_point
    assert_equal 40, @player1.tennis_score
    @player1.score_point
    assert_equal "Deuce", @player1.tennis_score
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
    tennis_scoring_array[point_total]
  end
  def tennis_scoring_array
    Array.[](0,15,30,40,"Deuce")
  end
end

class Game
  def self.winner?(player1, player2)
    return player1.name if has_more_than_three_scores(player1) && wins_by_two(player1, player2)
    return player2.name if has_more_than_three_scores(player2) && wins_by_two(player2, player1)
    "No winner yet"
  end
  def self.has_more_than_three_scores(player)
    player.point_total > 3
  end
  def self.wins_by_two(player1, player2)
    player1.point_total - player2.point_total > 1
  end
end
