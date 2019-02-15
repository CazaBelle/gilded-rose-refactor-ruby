# require File.join(File.dirname(__FILE__), 'gilded_rose')
require './lib/gilded_rose'

describe GildedRose do


  describe "#update_quality" do

    context 'normal items'do 
      before(:each) do 
        @items = [Item.new("foo", 10, 20)]
        @gildedrose = GildedRose.new(@items)
      end 

      it "does not change the name" do
        @gildedrose.update_quality()
        expect(@items[0].name).to eq "foo"
      end

      it "the sellin should reduce by 1 each day" do
        @gildedrose.update_quality()
        expect(@items[0].sell_in).to eq 9
      end 

      it "quality should reduce by 2 after sellin date" do 
        11.times { @gildedrose.update_quality() }
        expect(@items[0].quality).to eq 8
      end 
  
      it "quality should never be negative even after sellin date" do 
        14.times { @gildedrose.update_quality() }
        expect(@items[0].quality).to be >= 0
      end 
    end
  
    context "Aged Brie" do
      before(:each) do 
        @items = [Item.new("Aged Brie", 0, 5)]
        @gildedrose = GildedRose.new(@items)
      end 

      it "Aged Brie value increases by 2 after sellin" do 
        @gildedrose.update_quality()
        expect(@items[0].quality).to eq 7
        expect(@items[0].sell_in).to eq -1

      end 

      it "quality can never be greater then 50" do 
        25.times { @gildedrose.update_quality() }
        expect(@items[0].quality).to be <= 50
        expect(@items[0].sell_in).to equal -25
      end

    context "Sulfuras, Hand of Ragnaros" do 
      before(:each) do 
        @items =[Item.new("Sulfuras, Hand of Ragnaros", 0, 25)]
        @giledrose = GildedRose.new(@items)
      end 

      it "doesn't have a sellin date or decrease in quality" do 
        @gildedrose.update_quality()
        expect(@items[0].sell_in).to eq 0
        expect(@items[0].quality).to eq 25
      end 
    end 

    context "Backstage passes" do 
      it "value increases by 2 when they are 10 or less" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 20 )]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
        expect(items[0].quality).to eq 22
      end 

      it "value increases by 3 when sellin is equal to or less then 5 day" do 
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 20 )]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 4
        expect(items[0].quality).to eq 23
      end 

      it "value becomes zero when sellin day 0" do 
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 20 )]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -1 
        expect(items[0].quality).to eq 0
      end 
      
      end
    end
  end

end