require 'item'
class GildedRose

  def initialize(items)
    @items = items
    @aged_brie = "Aged Brie"
    @passes = "Backstage passes to a TAFKAL80ETC concert"
    @sulfuras = "Sulfuras, Hand of Ragnaros"
  end

  def update_quality()


    @items.each do |item|
      
      if item.name != @aged_brie and item.name != @passes
        if item.quality > 0
          if item.name != @sulfuras
            item.quality = item.quality - 1
          end
        end
      
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == @passes
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      
      if item.name != @sulfuras
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != @aged_brie
          if item.name != @passes
            if item.quality > 0
              if item.name != @sulfuras
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end

  def normal_update_quality(name, quality, sell_in)
    quality > 0 
    quality = quality - 1

  end



end