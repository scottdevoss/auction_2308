class Item
  attr_reader :name, :bids, :accepting_bids
  def initialize(name)
    @name = name
    @bids = {}
    # @accepting_bids = true
  end

  def add_bid(bidder, bid)
    @bids[bidder] = bid
  end

  def current_high_bid
    @bids.values.max
  end

  # def close_bidding
  #   open_to_bid = {}
  #   @accepting_bids = false
  # end
end