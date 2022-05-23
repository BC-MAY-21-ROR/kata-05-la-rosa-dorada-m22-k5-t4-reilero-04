# frozen_string_literal: true

require_relative 'normal_item'

class Backstage < NormalItem
  def initialize(sell_in, quality)
    super('Backstage passes to a TAFKAL80ETC concert', sell_in, quality)
  end

  def quality_lost_per_day
    if @sell_in <= 5
      3
    elsif @sell_in <= 10
      2
    elsif @sell_in > 10
      1
    end
  end

  def quality_lost_after_sell_in
    -50
  end
end
