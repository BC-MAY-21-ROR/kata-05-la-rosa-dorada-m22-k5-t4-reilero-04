# frozen_string_literal: true

require_relative 'normal_item'

# This class return quality for aged-brie items
class AgedBrieItem < NormalItem
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
