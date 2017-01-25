class GildedRose

  def initialize(items)
    @items = items
  end

  def split_items
    @items.each do |item|
      quality_dividing_items(item)
    end
  end

  def quality_dividing_items(item)
    if item.name == "Sulfuras, Hand of Ragnaros"
      return item.sell_in
    else
      return update_sell_in(item)
    end
  end

  def update_sell_in(item)
    item.sell_in -=  1
    return sell_in_date(item)
  end

  def sell_in_date(item)
    if item.sell_in > 0
      return update_quality(item)
    else
      return decrease_sell_in(item)
    end
  end

  def decrease_sell_in(item)
      if item.quality > 0
        item.quality -= 1
        return update_quality(item)
      end 
  end

  def update_quality(item)
    if item.name == "Aged Brie" || item.name == "Backstage passes to a TAFKAL80ETC concert"
      return increase_quality(item)
    else
      return decrease_quality(item)
    end
  end

  def increase_quality(item) # quality can only increase if quality more than 50
    return higher_quality(item) if item.quality < 50
  end

  def decrease_quality(item) # quality can only decrease if quality is above 0
    return less_quality(item) if item.quality > 0
  end

  def less_quality(item)
    if item.name != "Sulfuras, Hand of Ragnaros"
      return item.quality -= 1 # item decreases in quality by one
    end
  end

  def higher_quality(item)
      if item.sell_in < 11 && item.name == "Backstage passes to a TAFKAL80ETC concert"
        return backstage_item(item)
      else
        return item.quality += 1 # Aged Brie stops here - only increases by one per run
      end
  end

  def backstage_item(item)
    if item.sell_in < 6
      return sell_in_five(item)
    else
      return sell_in_ten(item)
    end
  end

  def sell_in_ten(item) # concert tickets increase less than 11 days
    return item.quality += 2
  end

  def sell_in_five(item) # concert tickets increase less then 6 days
    return item.quality += 3
  end





  def update_quality1(item)
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
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




      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0 # after sell_in date
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
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
