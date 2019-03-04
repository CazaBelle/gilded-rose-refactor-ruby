require 'item'
class GildedRose

  def initialize(items)
    @items = items
  
  end

  AGED_BRIE = "Aged Brie"
  PASSES = "Backstage passes to a TAFKAL80ETC concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"

  def update_quality()

    @items.each do |item|
      #normal item 
      if item.name != AGED_BRIE and item.name != PASSES
        if item.quality > 0
          if item.name != SULFURAS
            item.quality = item.quality - 1
          end
        end
      
      else
        #brie and backstage passes 
        if item.quality < 50
          item.quality = item.quality + 1

          #backstage passes 
          if item.name == PASSES
            if item.sell_in < 11
              change_quality_by(item, 1)
            end
            if item.sell_in < 6
              change_quality_by(item, 1)
    
            end
          end
        end
      end
      
      #all other items 
      if item.name != SULFURAS
        item.sell_in = item.sell_in - 1
      end

   #how normal items have their quality decreased if expired 
     if expired?(item)
        if item.name == AGED_BRIE
          change_quality_by(item, 1)
        elsif item.name == PASSES
          item.quality = item.quality - item.quality
        elsif item.name == SULFURAS
     
        else
          change_quality_by(item, -1)
          end
        end
      end
    end
  end



def change_quality_by(item, value)
  if item.quality > 0 && item.quality < 50 
    item.quality += value
  end 
end 

def expired?(item)
  item.sell_in < 0
end