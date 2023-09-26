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
end