# require File.join(File.dirname(__FILE__), 'gilded_rose')
require './lib/gilded_rose'

describe GildedRose do


  describe "#update_quality" do

    context 'normal items'do 
      it "does not change the name" do
        # need to mock this class
        items = [Item.new("foo", 0, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].name).to eq "foo"
      end

      it "the sellin should reduce by 1" do
        items = [Item.new("foo", 10, 0 )]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9

      end 

      it "quality should reduce by 2 after sellin date" do 
        items = [Item.new("foo", -1, 10 )]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 8
      end 
  
      it "quality should never be negative even after sellin date" do 
        items = [Item.new("foo", -4, 0 )]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to be >= 0
      end 
    end
  
    context "Aged Brie" do
      it "Aged Brie value increases by 2 after sellin" do 
        items = [Item.new("Aged Brie", -1, 6)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 8
        expect(items[0].sell_in).to eq -2

      end 

      it "quality can never be greater then 50" do 
        items = [Item.new("Aged Brie", 15, 50 )]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to be <= 50
        expect(items[0].sell_in).to equal 14
      end

    context "Sulfuras, Hand of Ragnaros" do 
      it "doesn't have a sellin date or decrease in quality" do 
        items =[Item.new("Sulfuras, Hand of Ragnaros", 0, 25)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 0
        expect(items[0].quality).to eq 25
      end 
    end 

    context "Backstage passes" do 
  
      it "value increases by 2 when they are 10 or less" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 20 )]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
        expect(items[0].quality).to eq 22
      end 
    end 

    end
  end

end