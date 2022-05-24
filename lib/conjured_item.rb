# frozen_string_literal: true

require_relative 'normal_item'

# This class return quality for conjured items
class ConjuredItem < NormalItem
  def initialize(sell_in, quality)
    super('Conjured', sell_in, quality)
  end

  def quality_lost_per_day
    -2
  end

  def quality_lost_after_sell_in
    -4
  end
end
