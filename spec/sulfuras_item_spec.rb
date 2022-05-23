require 'sulfuras_item'

describe SulfurasItem do
  it 'should never decrease sell_in' do
   sulfuras_item = SulfurasItem.new(5)
   sulfuras_item.update_quality
   expect(sulfuras_item.sell_in).to eq(5)
  end

  it 'should never decrease quality' do
   sulfuras_item = SulfurasItem.new(5)
   sulfuras_item.update_quality
   expect(sulfuras_item.quality).to eq(80)
  end
  
end
