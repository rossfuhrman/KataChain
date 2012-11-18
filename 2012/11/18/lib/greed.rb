class Greed
  def dice_bag=(dice_array)
    @dice_bag = dice_array
  end
  def score
    score = 0
    score += score_ones
    score += score_triples_greater_than_1
    score += score_single_fives
    score
  end
  def score_ones
    score = 0
    score += 1000 if has_triples_of(1)
    score += score_single_ones
    score
  end
  def has_triples_of(score_to_look_for)
    count(score_to_look_for) >= 3
  end
  def count(score_to_look_for)
    count = 0
    @dice_bag.each do |roll|
      count += 1 if roll == score_to_look_for
    end
    count
  end
  def score_triples_greater_than_1
    match = 0
    for i in 2..6
      match = i if has_triples_of(i)
    end
    match * 100
  end
  def score_single_fives
    50 * count_singles_of(5)
  end
  def score_single_ones
    100 * count_singles_of(1)
  end
  def count_singles_of(score)
    has_triples_of(score) ? count(score) - 3 : count(score)
  end
end
