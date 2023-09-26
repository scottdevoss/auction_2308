require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do
  describe '#initialize' do
    it 'can initialize' do
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')

      expect(item1).to be_an_instance_of(Item)
      expect(item1.name).to eq('Chalkware Piggy Bank')
    end
  end

  describe '#bids and #add_bid(bidder, bid)' do
    it 'can add bids and return what bids have been made by which attendee' do
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')
      item3 = Item.new('Homemade Chocolate Chip Cookies')
      item4 = Item.new('2 Days Dogsitting')
      item5 = Item.new('Forever Stamps')

      attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

      auction = Auction.new

      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)

      expect(item1.bids).to eq({})

      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)

      expect(item1.bids).to eq({attendee1 => 22, attendee2 => 20})
    end
  end

  describe '#current_high_bid' do
    it 'can return current highest bid' do
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')
      item3 = Item.new('Homemade Chocolate Chip Cookies')
      item4 = Item.new('2 Days Dogsitting')
      item5 = Item.new('Forever Stamps')

      attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

      auction = Auction.new

      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)

      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)

      expect(item1.current_high_bid).to eq(22)
    end
  end

  # describe '#close_bidding' do
  #   xit 'can close bidding on an item' do
  #     item1 = Item.new('Chalkware Piggy Bank')
  #     item2 = Item.new('Bamboo Picture Frame')
  #     item3 = Item.new('Homemade Chocolate Chip Cookies')
  #     item4 = Item.new('2 Days Dogsitting')
  #     item5 = Item.new('Forever Stamps')

  #     attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
  #     attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
  #     attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

  #     auction = Auction.new

  #     auction.add_item(item1)
  #     auction.add_item(item2)
  #     auction.add_item(item3)
  #     auction.add_item(item4)
  #     auction.add_item(item5)

  #     item1.add_bid(attendee2, 20)
  #     item1.add_bid(attendee1, 22)
  #     item4.add_bid(attendee3, 50)
  #     item3.add_bid(attendee2, 15)

  #     expect(item1.close_bidding).to eq({item1 => false, item2 => true, item3 => true, item4 => true})
  #   end 
  # end 
end