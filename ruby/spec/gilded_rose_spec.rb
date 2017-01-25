require_relative 'spec_helper'


describe GildedRose do

  subject(:gildedrose) { described_class.new(items) }

  let(:items) { [Item.new("foo", 0, 10), Item.new("Aged Brie", 1, 20) ] }

  describe '#item' do
    it "should return the quality of the item" do
      expect(items[1].quality).to eq(20)
    end
  end

  describe "#update_quality" do
    it "should return the item to increase_quality" do
      item = items[1]
      gildedrose.split_items
      expect(gildedrose.increase_quality(item)).to eq(item)
    end
  end

    describe "#has_quality" do
      it "should return item quality" do
        item = items[0]
        gildedrose.split_items
        expect(item.quality).to eq(9)
      end
    end

end
