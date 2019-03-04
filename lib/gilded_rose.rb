require 'item'


class ItemUpdater
  attr_reader :item, :value
  
  def initialize(item, value)
    @item = item
    @value = value
  end

  def update
    change_quality_by(item, value) 
    change_quality_by(item, value) if expired?(item)
  end

end

class BackStagePassUpdater < ItemUpdater
  def value 
    if expired?(item)
      -item.quality
    elsif item.sell_in < 5
      3
    elsif item.sell_in <10
      2
    else
      1
    end
  end 
  
  def update
    change_quality_by(item, 1)
    if item.sell_in < 10
      change_quality_by(item, 1)
    end
    if item.sell_in < 5
      change_quality_by(item, 1)
    end
    item.quality = item.quality - item.quality if expired?(item)
  end
end

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
          BackStagePassUpdater.new(item, 1).update
          when AGED_BRIE
            ItemUpdater.new(item, 1).update

          when SULFURAS
            #do nothing
          else
            ItemUpdater.new(item, -1).update
          
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
