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

  def find_by_id(id)
    items.find { |data| data.id == id }
  end

  def find_all_by_id(id)
    items.select { |data| data.id == id }
  end

  def find_by_name(name)
    items.find { |data| data.name.downcase == name.downcase }
  end
  
  def find_all_by_name(name)
    items.select { |data| data.name.downcase == name.downcase }
  end
  
  def find_by_description(description)
    items.find { |data| data.description == description }
  end

  def find_all_by_description(description)
    items.select { |data| data.description == description }
  end

  def find_by_unit_price(unit_price)
    items.find { |data| data.unit_price == unit_price }
  end

  def find_all_by_unit_price(unit_price)
    items.select { |data| data.unit_price == unit_price }
  end

  def find_by_merchant_id(merchant_id)
    items.find { |data| data.merchant_id == merchant_id }
  end

  def find_all_by_merchant_id(merchant_id)
    items.select { |data| data.merchant_id == merchant_id }
  end

  def find_by_created_at(created_at)
    items.find { |data| data.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    items.select { |data| data.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    items.find { |data| data.updated_at == updated_at }
  end
  
  def find_all_by_updated_at(updated_at)
    items.select { |data| data.updated_at == updated_at }
  end

end
