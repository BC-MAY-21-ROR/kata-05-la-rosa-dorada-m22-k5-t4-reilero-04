# frozen_string_literal: true

require 'normal_item'

describe NormalItem do
  it 'should decrease quality by 1' do
    normal_item = NormalItem.new('Normal item 1', 5, 5)
    normal_item.update_quality
    expect(normal_item.quality).to eq(4)
    expect(normal_item.sell_in).to eq(4)
  end

  it 'should decrease quality by 2' do
    normal_item = NormalItem.new('Normal item 2', 0, 5)
    normal_item.update_quality
    expect(normal_item.quality).to eq(3)
    expect(normal_item.sell_in).to eq(-1)
  end

  it 'quality should never be below 0' do
    normal_item = NormalItem.new('Normal item 3', 0, 0)
    normal_item.update_quality
    expect(normal_item.quality).to eq(0)
    expect(normal_item.sell_in).to eq(-1)
  end
end
