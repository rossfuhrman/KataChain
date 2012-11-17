class Greed
  def dice_bag=(dice_array)
    @dice_bag = dice_array
  end
  def score
    total = sum_ones
    total += sum_twos_through_sixes
    total += sum_single_fives
    total
  end
  def dice_bag_count(score_to_look_for)
    count = 0
    @dice_bag.each do |score|
      count += 1 if score == score_to_look_for
    end
    count
  end
  def sum_ones
    total = 0
    total = 1000 if dice_bag_count(1) >= 3
    total += 100 * count_of_remaining_single(1)
  end
  def sum_twos_through_sixes_why_does_this_work
    total = 0
    for i in 2..6
       return 100 * i if dice_bag_count(i) >=3
    end
    #why is the result of the for loop getting assigned to total
    total
  end
  def sum_twos_through_sixes
    total = 0
    for i in 2..6
       total += 100 * i if dice_bag_count(i) >=3
    end
    total
  end
  def sum_single_fives
    total = 50 * count_of_remaining_single(5)
  end
  def count_of_remaining_single(number)
    count_of_number = dice_bag_count(number)
    count_of_number >= 3 ? (count_of_number - 3) : count_of_number
  end
end
