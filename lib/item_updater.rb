class ItemUpdater
  attr_reader :item, :value
  
    def initialize(item, value=1)
      @item = item
      @value = value
    end

    def change_quality_by(item, value)
      if item.quality < 50 && item.quality > 0 
        item.quality = item.quality + value
      end
    end 
  
    def expired?(item)
      item.sell_in < 0
    end

    def update
      change_quality_by(item, value) 
      change_quality_by(item, value) if expired?(item)
    end


end