# frozen_string_literal: true

require 'aged_brie'

describe AgedBrie do
  it 'should increment quality the older it gets' do
    aged_brie_item = AgedBrie.new(5, 10)
    aged_brie_item.update_quality
    expect(aged_brie_item.quality).to eq(11)
  end

  it 'should increment quality twice as fast if sell_in is below 0' do
    aged_brie_item = AgedBrie.new(0, 10)
    aged_brie_item.update_quality
    expect(aged_brie_item.quality).to eq(12)
  end
end
