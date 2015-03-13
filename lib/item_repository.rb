require_relative 'item'
require_relative 'parser'

class ItemRepository

  attr_reader :items

  include Parser

  def initialize(data, engine)
    @engine = engine
    @items  = data.map { |line| Item.new(line, self) }
  end

  def inspect
    "#<{self.class} #{@items.size} rows>"
  end

  def all
    items
  end

  def random
    items.sample
  end

end
