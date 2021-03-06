require 'item'
require 'item_updater'
require 'backstage_passes'
require 'constants'


class GildedRose

  def initialize(items)
    @items = items
  end

  include Constants 

  def update_quality()
    @items.each do |item|
   # all other items 
      if item.name != SULFURAS
        item.sell_in -= 1
      end

      case item.name
        when PASSES
          BackStagePassUpdater.new(item, 1).update_passes
          when AGED_BRIE
            ItemUpdater.new(item).update
          when SULFURAS
            #do nothing
          else
            ItemUpdater.new(item, -1).update
        end
      end
    end
  end


