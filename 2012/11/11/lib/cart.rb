class Cart
  attr_reader :total, :items, :produce
  def initialize
    @total = 0
    @items = []
    @produce = {}
  end
  def add_item(item_name)
    @total += item_price_lookup[item_name]
    @items << item_name
  end
  def add_produce(produce_name, weight)
    @total += produce_price_lookup[produce_name] * weight
    if @produce[produce_name]
      @produce[produce_name] += weight
    else
      @produce[produce_name] = weight
    end
  end
  def print
    output = ""
    @items.each do |item_name|
      output << item_name + " = " + sprintf('%.2f', item_price_lookup[item_name]) + "\n"
    end
    @produce.each do |produce_name, weight|
      cost = sprintf('%.2f', produce_price_lookup[produce_name] * weight)
      output << produce_name + " * " + weight.to_s + "lbs = " + cost + "\n"
    end
    output
  end
  def item_price_lookup
    {"Bread" => 1, "Noodles" => 0.5, "Soup" => 2}
  end
  def produce_price_lookup
    {"Apples" => 2}
  end
end
