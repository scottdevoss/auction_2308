class Auction
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    item_names = []
    @items.each do |item|
      item_names << item.name
    end
    item_names
  end

  def unpopular_items
   unpopular_items = []
    @items.select do |item|
      if item.bids.empty?
      unpopular_items << item
      end
    end
    unpopular_items
  end

  def potential_revenue
    potential_revenue = 0
    @items.each do |item|
      if item.bids.empty?
        0
      else
        potential_revenue += item.current_high_bid
      end 
    end 
    potential_revenue
  end
end