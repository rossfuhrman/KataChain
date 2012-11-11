class Cart
  attr_reader :items, :produce
  def initialize
    @items = Items.new
    @produce = Produce.new
  end
  def add_item(item_name)
    @items.add_item(item_name)
  end
  def add_produce(produce_name, weight)
    @produce.add_produce(produce_name, weight)
  end
  def total
    amount = @items.total
    amount += @produce.total
  end
  def print
    output = @items.print
    output += @produce.print
  end
end

class Items
  attr_reader :items
  def initialize
    @items = {}
  end
  def add_item(item_name)
    if @items[item_name]
      @items[item_name] += 1
    else
      @items[item_name] = 1
    end
  end
  def print
    output = ""
    @items.each do |item_name, quantity|
      cost = sprintf('%.2f', item_price_lookup[item_name] * quantity)
      output += item_name + " * " + quantity.to_s + " = " + cost + "\n"
    end
    output
  end
  def total
    cost = 0
    @items.each do |item_name, quantity|
      cost += item_price_lookup[item_name] * quantity
    end
    cost
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
  def add_produce(produce_name, weight)
    if @produce[produce_name]
      @produce[produce_name] += weight
    else
      @produce[produce_name] = weight
    end
  end
  def print
    output = ""
    @produce.each do |produce_name, weight|
      cost = sprintf('%.2f', produce_price_lookup[produce_name] * weight)
      output += produce_name + " * " + weight.to_s + "lbs = " + cost + "\n"
    end
    output
  end
  def total
    cost = 0
    @produce.each do |produce_name, weight|
      cost += produce_price_lookup[produce_name] * weight
    end
    cost
  end
  def produce_price_lookup
    {"Apples" => 2}
  end
end
