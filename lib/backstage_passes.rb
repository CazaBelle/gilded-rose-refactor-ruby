class BackStagePassUpdater < ItemUpdater
  
  def value
    if expired?(item)
      -item.quality
    elsif item.sell_in < 5
      3
    elsif item.sell_in < 10
      2
    else
      @value
    end
  end 

  def update_passes
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
  