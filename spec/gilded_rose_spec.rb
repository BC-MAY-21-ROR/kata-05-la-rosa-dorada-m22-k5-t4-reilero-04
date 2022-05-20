# require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end

    it ' item is Aged brie' do
      items = [Item.new('Aged Brie', 5, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq(4)
    end

    it ' item is Aged brie quality after one day' do
      items = [Item.new('Aged Brie', 5, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq(11)
    end

    it ' item is Aged brie quality when sell_in is 0' do
      items = [Item.new('Aged Brie', 0, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq(12)
    end

    it ' item is Aged brie quality when sell_in is under 0' do
      items = [Item.new('Aged Brie', -1, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq(12)
    end

    it ' item when item has quality 50' do
      items = [Item.new('Aged Brie', -1, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq(50)
    end

    # Testing another item instead Aged Brie
    it ' item quality never it will be less than 0' do
      items = [Item.new('Foo', -1, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq(0)
    end

    it ' Items sell_in > 0, Quality degrades once ' do
      items = [Item.new('Foo', 2, 4)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq(3)
    end

    it ' Once the sell by date has passed, Quality degrades twice as fast ' do
      items = [Item.new('Foo', -1, 4)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq(2)
    end

    # Testing item Backstage passes
    it ' backstage increase quality by 2 when sell_in is less or equal than 10 ' do
      backstage = 'Backstage passes to a TAFKAL80ETC concert'
      items = [Item.new(backstage, 10, 4)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq(6)
    end

    it ' backstage increase quality by 3 when sell_in is less or equal than 5 ' do
      backstage = 'Backstage passes to a TAFKAL80ETC concert'
      items = [Item.new(backstage, 5, 4)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq(7)
    end

    it ' backstage reset quality to 0 after the concert ' do
      backstage = 'Backstage passes to a TAFKAL80ETC concert'
      items = [Item.new(backstage, 0, 4)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq(0)
    end

    # Testing sulfura item

    it 'Sulfuras never modified its property sell_in' do
      sulfura = 'Sulfuras, Hand of Ragnaros'
      items = [Item.new(sulfura, 4, 4)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq(4)
    end

    it 'Sulfuras never has to decreased in quality' do
      sulfura = 'Sulfuras, Hand of Ragnaros'
      items = [Item.new(sulfura, 5, 5)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq(5)
    end

    # Testing new feature conjurados
    it 'conjured items degrade in Quality twice as fast as normal items' do
      conjured = 'Conjured item'
      items = [Item.new(conjured, 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq(0)
    end

    it 'conjured items does not afect its sell_in property' do
      conjured = 'Conjured item'
      items = [Item.new(conjured, 5, 5)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq(4)
    end
  end
end
