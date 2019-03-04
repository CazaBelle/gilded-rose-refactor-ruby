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
      
      #all other items 
      if item.name != SULFURAS
        item.sell_in = item.sell_in - 1
      end

   #how normal items have their quality decreased if expired 
      if item.sell_in < 0
        if item.name != AGED_BRIE
          if item.name != PASSES
            if item.quality > 0
              if item.name != SULFURAS
                item.quality = item.quality - 1
              end
            end
            #backstage pass goes to 0 when expired 
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

def increase_item_quality(item)
 
end

end