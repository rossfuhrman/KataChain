class Cart
  attr_reader :items, :produce
  def initialize
    @items = {}
    @produce = {}
  end
  def add_item(item_name)
    add_item_to_cart(@items, item_name, 1)
  end
  def add_produce(item_name, weight)
    add_item_to_cart(@produce, item_name, weight)
  end
  def add_item_to_cart(item_hash, item_name, quantity)
    if item_hash[item_name]
      item_hash[item_name] += quantity
    else
      item_hash[item_name] = quantity
    end
  end
  def total
    total = total_items(@items, item_price_lookup)
    total += total_items(@produce, produce_price_lookup)
  end
  def total_items(item_hash, lookup_hash)
    total = 0
    item_hash.each do |cart_item, quantity|
      lookup_hash.each do |item, price|
        if cart_item == item
          total += quantity * price
        end
      end
    end
    total
  end
  def print
    output = print_items(@items, item_price_lookup, "")
    output << print_items(@produce, produce_price_lookup, "lbs")
  end
  def print_items(items, price_lookup, meausurement)
    output = ""
    items.each do |cart_item, quantity|
      price_lookup.each do |item, price|
        if cart_item == item
          amount = sprintf('%.2f', price*quantity)
          output << item + " * " + quantity.to_s + meausurement + " = " + amount  + "\n" 
        end
      end
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
