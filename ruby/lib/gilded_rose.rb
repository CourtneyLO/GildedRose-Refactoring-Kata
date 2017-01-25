class GildedRose

  def initialize(items)
    @items = items
  end

  def split_items
    @items.each do |item|
      return update_quality(item)
    end
  end

  def update_quality(item)
    if item.name == "Aged Brie" and item.name == "Backstage passes to a TAFKAL80ETC concert"
      return increase_quality(item)
    else
      return decrease_quality(item)
    end
  end

  def increase_quality(item) # quality can only increase if quality more than 50
    return item
  end

  def decrease_quality(item) # quality can only decrease if quality is above 0
    raise "Quality cannot be decreased: quality of items cannot be negavtive" unless item.quality > 0
    return new_quality(item)
  end

  def new_quality(item)
    if item.name != "Sulfuras, Hand of Ragnaros"
      return item.quality = item.quality - 1
    end
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
      if item.sell_in < 0
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
