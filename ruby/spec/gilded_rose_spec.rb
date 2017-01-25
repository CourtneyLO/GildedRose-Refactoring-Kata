require_relative 'spec_helper'


describe GildedRose do

  subject(:gildedrose) { described_class.new(items) }

  let(:items) { [Item.new("foo", 0, 1), Item.new("Aged Brie", 0, 1) ] }


  describe "#split_items" do
    it "should separate the items list into single items" do
      item = items[0]
      expect(gildedrose.split_items).to eq(gildedrose.update_quality(item))
    end
  end

  describe "#update_quality" do
    it "should return the item to increase_quality" do
      item = items[0]
      gildedrose.split_items
      expect(gildedrose.update_quality(item)).to eq(gildedrose.increase_quality(item))
    end

    it "should return the item to decrease_quantity" do
      item = items[1]
      gildedrose.split_items
      expect(gildedrose.update_quality(item)).to eq(gildedrose.decrease_quality(item))
    end
  end




end
