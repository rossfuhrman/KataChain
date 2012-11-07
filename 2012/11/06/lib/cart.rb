class Cart
  attr_reader :items, :produce
  def initialize
    @items = Hash.new
    @produce = Hash.new
  end
  def print_receipt
    output = ""
    @items.each do |item,quantity|
      inventory_lookup.each do |inventory_name, price|
        if item == inventory_name 
          output += item.to_s + " * " + quantity.to_s + " = " + sprintf('%.2f', (quantity * price)) + "\n"
        end
      end
    end
    @produce.each do |item, weight|
      produce_price_lookup.each do |produce_name, price|
        if item == produce_name
          output += item.to_s + " - " + weight.to_s + " lbs = " + sprintf('%.2f', (weight * price)) + "\n"
        end
      end
    end
    output
  end
  def total
    total = 0
    @items.each do |item,quantity|
      inventory_lookup.each do |inventory_name, price|
        if item == inventory_name 
          total += quantity * price
        end
      end
    end
    total
  end
  def add_item(item_name)
    if @items[item_name] 
      @items[item_name] += 1
    else 
      @items[item_name] = 1
    end
  end
  def add_produce(item_name, weight)
    if @produce[item_name] 
      @produce[item_name] += weight
    else 
      @produce[item_name] = weight
    end
  end
  def inventory_lookup
    {"Bread" => 1, "Noodles" => 0.5, "Soup" => 2}
  end
  def produce_price_lookup
    {"Apple" => 2}
  end
end
