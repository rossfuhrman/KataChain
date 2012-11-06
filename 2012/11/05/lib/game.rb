class Game
  def self.who_won(player1, player2)
    if has_winner?(player1, player2)
      return player1.point_total > player2.point_total ? player1.name : player2.name
    end
    "No winner yet."
  end
  def self.has_winner?(player1, player2)
    return true if has_at_least_four_scores(player1, player2) && a_player_has_a_two_point_lead(player1, player2)
    false
  end
  def self.has_at_least_four_scores(player1, player2)
    player1.point_total > 3 || player2.point_total > 3
  end
  def self.a_player_has_a_two_point_lead(player1, player2)
    (player1.point_total - player2.point_total).abs > 1
  end

end
