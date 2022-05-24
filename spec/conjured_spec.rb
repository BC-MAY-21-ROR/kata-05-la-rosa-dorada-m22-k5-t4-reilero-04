# frozen_string_literal: true

require 'conjured'

describe Conjured do
  it 'decrease quality by 2 if sell_in > 0' do
    conjured_item = Conjured.new(10, 10)
    conjured_item.update_quality
    expect(conjured_item.quality).to eq(8)
  end

  it 'quality decrease by 4 if sell_in <= 0' do
    conjured_item = Conjured.new(0, 8)
    conjured_item.update_quality
    expect(conjured_item.quality).to eq(4)
  end
end
