require_relative 'spec_helper'


describe GildedRose do

  subject(:gildedrose) { described_class.new(items) }

  let(:items) { [Item.new("foo", 0, 10),
                 Item.new("Apples", 2, 0),
                 Item.new("Aged Brie", 1, 0),
                 Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 20),
                 Item.new("Backstage passes to a TAFKAL80ETC concert", 9, 20),
                 Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 20),
                 Item.new("Sulfuras, Hand of Ragnaros", 0, 20)
                 ] }

  describe '#item' do
    it "should return the quality of the item" do
      expect(items[2].quality).to eq(0)
      expect(items[2].name).to eq("Aged Brie")
    end
  end

  describe "#update_quality" do
    it "should return the item to increase_quality" do
      item = items[2]
      expect(gildedrose.increase_quality(item)).to eq(1)
    end

    it "should return the item to decrease_quality" do
      item = items[0]
      expect(gildedrose.decrease_quality(item)).to eq(item.quality)
    end
  end

  describe "#decrease_quality" do
    context "#lower_quality" do
      it "should decrease item quality" do
          item = items[0]
          gildedrose.quality_dividing_items(item)
          expect(item.quality).to eq(9)
      end
    end
  end

  describe "#increase_quality" do
    context "#higher.quality" do
      it "should increase in quality as product gets older" do
        item = items[2]
        gildedrose.quality_dividing_items(item)
        expect(item.quality).to eq(1)
      end

      it "should return item quantity increased by 1 when item name is Backstage passes to a TAFKAL80ETC concert" do
        item = items[3]
        expect(gildedrose.quality_dividing_items(item)).to eq(21)
      end
    end

    context "#backstage_item" do
      it "should return item quanitity increased by 2 when Backstage and sell in is less than 11 days" do
        item = items[4]
        expect(gildedrose.quality_dividing_items(item)).to eq(22)
      end

      it "should return item quanitity increased by 3 when Backstage and sell in is less than 6" do
        item = items[5]
        expect(gildedrose.quality_dividing_items(item)).to eq(23)
      end
    end
  end

  describe "#updating_sell_in" do
    it "should decrease the sell_in number by 1" do
      item = items[1]
      gildedrose.quality_dividing_items(item)
      expect(item.sell_in).to eq(1)
    end

    # it "should decrease  "
  end

  describe "#split product" do
    it "should determine if the product loses quality over time" do
      item = items[6]
      gildedrose.quality_dividing_items(item)
      expect(item.sell_in).to eq(0)
    end
  end

end
