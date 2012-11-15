class Greed
  def dice_bag=(dice_array)
    @dice_bag = dice_array
  end
  def score
    scores = count_dice
    total = score_ones(scores)
    total += score_single_fives(scores)
    for i in 2..6 
      total += 100 * i if scores[i].to_i >= 3
    end
    return total
  end
  def count_dice
    scores = {}
    @dice_bag.each do |roll_value|
      if scores[roll_value]
        scores[roll_value] += 1
      else
        scores[roll_value] = 1
      end
    end
    scores
  end
  def score_ones(scores)
    total = 0
    ones = scores[1].to_i
    if ones > 2
      total += 1000
      ones -= 3
    end
    while ones > 0
      total += 100
      ones -= 1
    end
    total
  end
  def score_single_fives(scores)
    total = 0
    fives = (scores[5].to_i > 2) ? (scores[5].to_i - 3) : (scores[5].to_i)
    while fives > 0
      total += 50
      fives -= 1
    end
    total
  end
end
