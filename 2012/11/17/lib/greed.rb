class Greed
  def dice_bag=(dice_array)
    @dice_bag = dice_array
  end
  def score
    total = score_ones
    total += score_triples_greater_than_one
    total += score_for_single_fives
  end
  def has_triple?(amount)
    count = 0
    @dice_bag.each do |dice_score|
      count += 1 if dice_score == amount
    end
    count >= 3
  end
  def score_triples_greater_than_one
    match = 0
    for i in 2..6
      match = i if has_triple?(i)
    end
    match * 100
  end
  def score_for_single_fives
    50 * count_single(5)
  end
  def score_single_ones
    100 * count_single(1)
  end
  def count_single(score_to_look_for)
     count(score_to_look_for) >= 3 ? count(score_to_look_for) - 3 : count(score_to_look_for) 
  end
  def count(score_to_look_for)
    count = 0
    @dice_bag.each do |dice_score|
      count += 1 if dice_score == score_to_look_for
    end
    count 
  end
  def score_ones
    total = 0
    total += 1000 if has_triple?(1)
    total += score_single_ones
  end
end
