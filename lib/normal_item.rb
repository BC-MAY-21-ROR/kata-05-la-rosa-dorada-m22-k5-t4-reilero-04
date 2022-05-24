# frozen_string_literal: true

require_relative 'item'

# This class return quality for conjured items
class NormalItem < Item
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality
    @quality += @sell_in <= 0 ? quality_lost_after_sell_in : quality_lost_per_day

    @sell_in -= 1
    @quality = 0 if @quality.negative?
    @quality = 50 if @quality > 50
  end

  def quality_lost_per_day
    -1
  end

  def quality_lost_after_sell_in
    -2
  end
end
