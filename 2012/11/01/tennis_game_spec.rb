require 'minitest/autorun'

class TestTennisGame < MiniTest::Unit::TestCase
  def setup
    @player1 = Player.new("Bob Player1")
    @player2 = Player.new("Alice Player2")
  end
  def test_player_starts_with_zero_points
    assert_equal 0, @player1.score
  end
  def test_player_can_score_points
    @player1.score_point
    assert_equal 1, @player1.score
  end
  def test_player_can_win_game_after_four_scores
    4.times do
      @player1.score_point
    end
    assert_equal "Bob Player1", Game.winner?(@player1, @player2)
  end
  def test_can_determine_when_no_one_has_won
    assert_equal "No winner yet.", Game.winner?(@player1, @player2)
  end
  def test_have_to_win_by_two
    4.times do
      @player1.score_point
      @player2.score_point
    end
    assert_equal "No winner yet.", Game.winner?(@player1, @player2)
    @player1.score_point
    assert_equal "No winner yet.", Game.winner?(@player1, @player2)
    @player1.score_point
    assert_equal "Bob Player1", Game.winner?(@player1, @player2)
  end
  def test_can_get_correct_tennis_score
    @player1.score_point
    assert_equal 15, @player1.tennis_score
  end
end

class Player
  attr_reader :score, :name
  def initialize(name)
    @name = name
    @score = 0
  end
  def score_point
    @score += 1
  end
  def tennis_score
    tennis_scoring_sequence[@score]
  end
  def tennis_scoring_sequence
    Array.[](0, 15, 30, 40, "Deuce")
  end
end

class Game
  def self.winner?(player1, player2)
    return player1.name if player_has_won(player1, player2)
    return player2.name if player_has_won(player2, player1)
    "No winner yet."
  end
  def self.player_has_won(player1, player2)
    has_at_least_four_scores(player1) && has_at_least_two_point_lead(player1, player2)
  end
  def self.has_at_least_four_scores(player)
    player.score > 3
  end
  def self.has_at_least_two_point_lead(player1, player2)
    player1.score - player2.score > 1
  end
end
