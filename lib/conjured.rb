# frozen_string_literal: true

require_relative 'normal_item'

class Conjured < NormalItem
  def initialize(sell_in, quality)
    super('Conjured', sell_in, quality)
  end

  def quality_lost_per_day
    -1 * 2
  end

  def quality_lost_after_sell_in
    -2 * 2
  end
end
