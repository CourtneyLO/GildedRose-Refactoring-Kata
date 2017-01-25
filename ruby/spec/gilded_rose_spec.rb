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



  end

end
