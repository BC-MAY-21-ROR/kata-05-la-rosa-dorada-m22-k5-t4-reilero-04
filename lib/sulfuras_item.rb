# frozen_string_literal: true

require_relative 'normal_item'

class SulfurasItem < NormalItem
  def initialize(sell_in)
    super('Sulfuras, Hand of Ragnaros', sell_in, 80)
  end

  def update_quality; end

  def quality_lost_per_day
    0
  end

  def quality_lost_after_sell_in
    0
  end
end
