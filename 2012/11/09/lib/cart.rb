class Cart
  attr_reader :items, :produce
  def initialize
    @items = {}
    @produce = {}
  end
  def total
    cost = @items.inject(0) { |item_total, (item,price)|
      item_total + item_price_lookup[item] * price 
    }
    cost += @produce.inject(0) { |produce_total, (produce_name,weight)| 
      produce_total + produce_price_lookup[produce_name] * weight 
    }
  end
  def add_item(item_name)
    add_item_to(@items, item_name, 1)
  end
  def add_produce(produce_name, weight)
    add_item_to(@produce, produce_name, weight)
  end
  def add_item_to(hash, item_name, weight_or_quantity)
    if hash[item_name]
      hash[item_name] += weight_or_quantity
    else
      hash[item_name] = weight_or_quantity
    end
  end
  def item_price_lookup
    {"Bread" => 1, "Noodles" => 0.5, "Soup" => 2}
  end
  def produce_price_lookup
    {"Apples" => 2}
  end
  def print
    output = print_items
    output += print_produce
    output += "Total = " + format(total)
  end
  def print_items
    output = ""
    @items.each do |item_name, quantity|
      cost = format(item_price_lookup[item_name] * quantity)
      output += item_name + " * " + quantity.to_s + " = " + cost + "\n"
    end
    output
  end
  def print_produce
    output = ""
    @produce.each do |produce_name, weight|
      cost = format(produce_price_lookup[produce_name] * weight)
      output += produce_name + " * " + weight.to_s + "lbs = " + cost + "\n"
    end
    output
  end
  def format(value)
    sprintf('%.2f', value)
  end
end


