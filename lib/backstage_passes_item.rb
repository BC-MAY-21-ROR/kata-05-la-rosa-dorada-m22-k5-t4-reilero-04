# frozen_string_literal: true

require_relative 'normal_item'

# This class return quality for backstage items
class BackstagePassesItem < NormalItem
  def initialize(sell_in, quality)
    super('Backstage passes to a TAFKAL80ETC concert', sell_in, quality)
    @sell_in = sell_in
  end

  def quality_lost_per_day
    if @sell_in <= 5
      3
    else
      @sell_in <= 10 ? 2 : 1
    end
  end

  def quality_lost_after_sell_in
    -50
  end
end
