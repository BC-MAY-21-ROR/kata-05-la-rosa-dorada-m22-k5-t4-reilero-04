# frozen_string_literal: true

require_relative 'item'
require_relative 'normal_item'
require_relative 'aged_brie'
require_relative 'backstage'
require_relative 'conjured'
require_relative 'sulfuras_item'

# This class return quality for an array of items
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each(&:update_quality)
  end
end

normal_items = NormalItem.new('Normal Item', 10, 10)
aged_brie_item = AgedBrie.new(10, 10)
backstage_item = Backstage.new(10, 10)
sulfura_item = SulfurasItem.new(10)
conjured_item = Conjured.new(10, 10)
list_items = GildedRose.new([normal_items, aged_brie_item, backstage_item, sulfura_item, conjured_item])
puts list_items.update_quality
