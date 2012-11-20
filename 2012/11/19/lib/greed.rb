class Greed
  def dice_bag=(dice_array)
    @dice_bag = dice_array
  end
  def score
    score = score_triple_ones
    score += score_triples_two_through_six
    score += score_single_ones
    score += score_single_fives
    score
  end
  def has_triple(roll_to_look_for)
    count(roll_to_look_for) >= 3
  end
  def score_triple_ones
    return 1000 if has_triple(1)
    0
  end
  def score_triples_two_through_six
    total = 0
    for i in 2..6
      total += 100 * i if count(i) >= 3
    end
    total 
  end
  def score_single_ones
    100 * count_of_single(1)
  end
  def score_single_fives
    50 * count_of_single(5)
  end
  def count_of_single(roll_to_look_for)
    has_triple(roll_to_look_for) ? count(roll_to_look_for) - 3 : count(roll_to_look_for)
  end
  def count(roll_to_look_for)
    count = 0
    @dice_bag.each do |roll|
      count += 1 if roll == roll_to_look_for
    end
    count
  end
end
