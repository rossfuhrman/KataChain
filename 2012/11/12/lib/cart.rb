class Cart
  attr_reader :total
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
      cost = format(item_price_lookup[item_name])
      output << "#{item_name} = #{cost}\n"
    end
    @produce.each do |produce_name, weight|
      price = format(produce_price_lookup[produce_name])
      cost = format(produce_price_lookup[produce_name] * weight)
      output << "#{produce_name} #{weight} * #{price}/lb = #{cost}\n"
    end
    output
  end
  def item_price_lookup
    {"Bread" => 1, "Noodles" => 0.5, "Soup" => 2}
  end
  def produce_price_lookup
    {"Apples" => 2}
  end
  def format(value)
    sprintf('%.2f', value)
  end
end
