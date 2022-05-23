# frozen_string_literal: true

require_relative 'item'

class NormalItem < Item
  def update_quality
    @quality += if @sell_in <= 0
                  quality_lost_after_sell_in
                else
                  quality_lost_per_day
                end

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
