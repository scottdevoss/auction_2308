require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Auction do
  describe '#initialize' do
    it 'can initialize' do
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')
      attendee = Attendee.new({name: 'Megan', budget: '$50'})
      auction = Auction.new

      expect(auction).to be_an_instance_of(Auction)
      expect(auction.items).to eq([])
    end
  end

  describe '#add_item(item)' do
    it "can add an item" do
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')
      attendee = Attendee.new({name: 'Megan', budget: '$50'})
      auction = Auction.new

      expect(auction.items).to eq([])

      auction.add_item(item1)
      auction.add_item(item2)

      expect(auction.items).to eq([item1, item2])
    end
  end

  describe '#item_names' do
    it "can add an item" do
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')
      attendee = Attendee.new({name: 'Megan', budget: '$50'})
      auction = Auction.new

      auction.add_item(item1)
      auction.add_item(item2)

      expect(auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
    end
  end

  describe '#unpopular_items' do
    it 'can return an array of the items with no bids' do
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
      item4.add_bid(attendee3, 50)

      expect(auction.unpopular_items).to eq([item2, item3, item5])

      item3.add_bid(attendee2, 15)

      expect(auction.unpopular_items).to eq([item2, item5])
    end
  end

  describe '#potential_revenue' do
    it 'can return the total possible sale price of the items(the items highest bid)' do
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
      item4.add_bid(attendee3, 50)
      item3.add_bid(attendee2, 15)

      expect(auction.potential_revenue).to eq(87)
    end
  end
end