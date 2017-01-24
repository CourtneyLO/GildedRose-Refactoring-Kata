require 'spec_helper'


describe GildedRose do

  subject(:gildedrose) { described_class.new(items) }

  let(:items) { [Item.new("foo", 0, 0)] }

  describe "#update_quality" do
    it "does not change the name" do
      expect(items[0].name).to eq "foo"
    end
  end

end
