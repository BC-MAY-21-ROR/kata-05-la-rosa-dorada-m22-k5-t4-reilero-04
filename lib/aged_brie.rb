require 'normal_item'

class AgedBrie < NormalItem
 def initialize(sell_in, quality)
  super('Aged Brie', sell_in, quality)
 end

 def quality_lost_per_day
  1
 end

 def quality_lost_after_sell_in
  2
 end

end
