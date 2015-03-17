require_relative 'merchant'
require_relative 'parser'

class MerchantRepository

  attr_reader :merchants, :engine

  include Parser

  def initialize(data, engine)
    # needs to store all merchant data as instances in an array (use map?)
    # needs to reference the engine
    @engine    = engine
    @merchants = data.map { |line| Merchant.new(line, self) }
  end

  def inspect
    "#<{self.class} #{merchants.size} rows>"
  end

  def all
    merchants
  end

  def random
    merchants.sample
  end

  def find_by_id(id)
    merchants.find { |merchant| merchant.id == id }
  end

  def find_all_by_id(id)
    merchants.select { |merchant| merchant.id == id }
  end

  def find_by_name(name)
    merchants.find { |merchant| merchant.name == name }
  end

  def find_all_by_name(name)
    merchants.select { |merchant| merchant.name.downcase == name.downcase }
  end

  def find_by_created_at(created_at)
    merchants.find { |merchant| merchant.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    merchants.select { |merchant| merchant.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    merchants.find { |merchant| merchant.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    merchants.select { |merchant| merchant.updated_at == updated_at }
  end

  def find_items(id)
    engine.find_items_by_merchant_id(id)
  end

  def find_invoices(id)
    engine.find_invoice_by_invoice_id(id)
  end

end
