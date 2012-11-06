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
    if @point_total < 4
      return tennis_scoring_sequence[@point_total]
    end
    "Deuce"
  end
  def tennis_scoring_sequence
    Array.[](0,15,30,40)
  end
end
