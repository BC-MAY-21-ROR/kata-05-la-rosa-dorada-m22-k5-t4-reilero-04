# frozen_string_literal: true

# This class is base for another kind of item class
class Item
  attr_accessor :name, :sell_in, :quality

  # quality parameters can't be less than 0 => Refactoring
  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
