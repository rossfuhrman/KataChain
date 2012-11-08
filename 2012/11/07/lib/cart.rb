class Cart
  attr_reader :items, :produce
  def initialize
    @items = Items.new
    @produce = Produce.new
  end
  def add_item(item_name)
    @items.add_item(item_name)
  end
  def add_produce(item_name, weight)
    @produce.add_produce(item_name, weight)
  end
  def total
    sum = @items.sum_items
    sum += @produce.sum_produce
  end
  def print_line_items
    output = @items.items_output
    output += @produce.produce_items
  end
end



class Items
  attr_reader :items
  def initialize
    @items = {}
  end
  def add_item(item_name)
    @items[item_name] ? @items[item_name] += 1 : @items[item_name] = 1
  end
  def sum_items
    sum = 0
    @items.each do |item, quantity|
      sum += item_price_lookup[item] * quantity
    end
    sum
  end
  def items_output
    output = ""
    @items.each do |item, quantity|
      cost = sprintf('%.2f', item_price_lookup[item] * quantity)
      output += item + " * " + quantity.to_s + " = " + cost + "\n"
    end
    output
  end
  def item_price_lookup
    {"Bread" => 1, "Noodles" => 0.5, "Soup" => 2}
  end
end

class Produce
  attr_reader :produce
  def initialize
    @produce = {}
  end
  def add_produce(item_name, weight)
    @produce[item_name] ? @produce[item_name] += weight : @produce[item_name] = weight
  end
  def sum_produce
    sum = 0
    @produce.each do |item, weight|
      sum += produce_price_lookup[item] * weight
    end
    sum
  end
  def produce_items
    output = ""
    @produce.each do |item, weight|
      cost = sprintf('%.2f', produce_price_lookup[item] * weight)
      #output += item + " $" + produce_price_lookup[item] + "/lbs * " + weight + "lbs = " + cost + "\n"
      output += item + " $" + produce_price_lookup[item].to_s + "/lbs * " + weight.to_s + " lbs = " + cost + "\n"
    end
    output
  end
  def produce_price_lookup
    {"Apples" => 2}
  end
end
