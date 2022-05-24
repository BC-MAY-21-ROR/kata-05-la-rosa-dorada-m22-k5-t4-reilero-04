# frozen_string_literal: true

require 'backstage'

describe Backstage do
  it 'Increment quality by 1 in if sell_in > 10' do
    backstage_item = Backstage.new(11, 10)
    backstage_item.update_quality
    expect(backstage_item.quality).to eq(11)
  end

  it 'Increment quality by 2 in if sell_in <= 10' do
    backstage_item = Backstage.new(9, 10)
    backstage_item.update_quality
    expect(backstage_item.quality).to eq(12)
  end

  it 'Increment quality by 3 in if sell_in <= 5' do
    backstage_item = Backstage.new(4, 10)
    backstage_item.update_quality
    expect(backstage_item.quality).to eq(13)
  end

  it 'Quality should be 0 if sell_in == 0' do
    backstage_item = Backstage.new(0, 10)
    backstage_item.update_quality
    expect(backstage_item.quality).to eq(0)
  end

  it 'Quality should be 0 if sell_in < 0' do
    backstage_item = Backstage.new(-1, 10)
    backstage_item.update_quality
    expect(backstage_item.quality).to eq(0)
  end

  it 'Quality should not be more than 50' do
    backstage_item = Backstage.new(1, 50)
    backstage_item.update_quality
    expect(backstage_item.quality).to eq(50)
  end
end
