class Potter
  attr_reader :cart
  def initialize
    @cart = {}
  end
  def add_book(title)
    if @cart[title]
      @cart[title] += 1
    else
      @cart[title] = 1
    end
  end
  def total
    apply_discounts(@cart)
  end
  def apply_discounts(hash)
    total, temp_count = 0, 0
    new_hash = hash.inject({}) { |hash, (key,value)| 
      temp_count += 1 if value > 0
      hash[key] = value - 1
      hash
    }
    unless temp_count == 0
      total += apply_discounts(new_hash)
    end
    total += temp_count * 8.0 * discount_lookup[temp_count]
  end
  def discount_lookup
    {0 => 1.0, 1 => 1.0, 2 => 0.95, 3 => 0.9, 4 => 0.85, 5 => 0.75, 6 => 0.7, 7 => 0.65}
  end
end
