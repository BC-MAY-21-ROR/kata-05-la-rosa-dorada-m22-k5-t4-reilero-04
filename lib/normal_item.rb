require 'item'

class NormalItem < Item
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end
  
  def update_quality
    @sell_in -= 1
    if @quality > 0
      if @sell_in <= 0
        @quality += quality_lost_after_sell_in
      else
        @quality += quality_lost_per_day
      end
    else
      @quality = 0
    end
  end

  def quality_lost_per_day
    -1
  end

  def quality_lost_after_sell_in
    -2 
  end

end
