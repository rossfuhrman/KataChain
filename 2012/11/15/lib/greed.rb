class Greed
  def dice_bag=(dice_array)
    @dice_bag = dice_array
  end
  def score
    total = total_ones
    total += triples_for_two_through_six
    total += single_fives
  end
  def count(digit)
    count = 0
    @dice_bag.each do |roll|
      count += 1 if roll == digit
    end
    return count
  end
  def total_ones
    total = 0
    total += 1000 if count(1) >= 3
    total += 100 * ( count(1) >= 3 ? count(1) - 3 : count(1) )
  end
  def single_fives
    50 * ( count(5) >= 3 ? count(5) - 3 : count(5) )
  end
  def triples_for_two_through_six
    total = 0
    for i in 2..6 
      total += 100 * i if count(i) >= 3
    end
    total
  end
end
