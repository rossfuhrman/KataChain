class Greed
  def dice_bag=(dice_array)
    @dice_bag = dice_array
  end
  def score
    total = 0
    total += score_single_ones
    total += score_single_fives
    total += score_triple_ones
    total += score_triple_twos_through_sixes
    total
  end
  def count(score_to_look_for)
    total = 0
    @dice_bag.each do |roll|
      total += 1 if roll == score_to_look_for
    end
    total
  end
  def score_single_fives
    50 * count_singles(5)
  end
  def score_single_ones
    100 * count_singles(1)
  end
  def count_singles(score_to_look_for)
    (count(score_to_look_for) >= 3 ? count(score_to_look_for) - 3 : count(score_to_look_for))
  end
  def score_triple_twos_through_sixes
    total = 0
    for i in 2..6 
      total += 100 * i if count(i) >= 3
    end
    total
  end
  def score_triple_ones
    return 1000 if count(1) >= 3
    0
  end
end
