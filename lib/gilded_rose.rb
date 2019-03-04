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
   # all other items 
    if item.name != SULFURAS
      item.sell_in -= 1
     end

      case item.name
        when PASSES
          change_quality_by(item, 1)
          if item.sell_in < 10
            change_quality_by(item, 1)
          end
          if item.sell_in < 5
            change_quality_by(item, 1)
          end
          item.quality = item.quality - item.quality if expired?(item)
          when AGED_BRIE
            change_quality_by(item, 1)
            change_quality_by(item, 1) if expired?(item)
          when SULFURAS
            #do nothing
          else
            change_quality_by(item, -1) 
            change_quality_by(item, -1) if expired?(item)
          end
      end
    end
  end


def change_quality_by(item, value)
  if item.quality < 50 && item.quality > 0 
    item.quality = item.quality + value
  end
end 

def expired?(item)
  item.sell_in < 0
end
