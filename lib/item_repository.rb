require_relative 'item'
require_relative 'parser'

class ItemRepository

  attr_reader :items, :engine

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
    items.find { |item| item.id == id }
  end

  def find_all_by_id(id)
    items.select { |item| item.id == id }
  end

  def find_by_name(name)
    items.find { |item| item.name == name }
  end

  def find_all_by_name(name)
    items.select { |item| item.name == name }
  end

  def find_by_description(description)
    items.find { |item| item.description == description }
  end

  def find_all_by_description(description)
    items.select { |item| item.description == description }
  end

  def find_by_unit_price(unit_price)
    items.find { |item| item.unit_price == unit_price }
  end

  def find_all_by_unit_price(unit_price)
    items.select { |item| item.unit_price == unit_price }
  end

  def find_by_merchant_id(merchant_id)
    items.find { |item| item.merchant_id == merchant_id }
  end

  def find_all_by_merchant_id(merchant_id)
    items.select { |item| item.merchant_id == merchant_id }
  end

  def find_by_created_at(created_at)
    items.find { |item| item.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    items.select { |item| item.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    items.find { |item| item.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    items.select { |item| item.updated_at == updated_at }
  end

  def find_invoice_items(id)
    engine.find_invoice_items_by_item_id(id)
  end

  def find_merchant(merchant_id)
    engine.find_merchant_by_merchant_id_for_item(merchant_id)
  end

end
