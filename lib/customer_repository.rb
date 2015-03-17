require_relative 'customer'
require_relative 'parser'

class CustomerRepository

  attr_reader :customers, :engine

  include Parser

  def initialize(data, engine)
    @engine    = engine
    @customers = data.map { |line| Customer.new(line, self) }
  end

  def inspect
    "#<{self.class} #{customers.size} rows>"
  end

  def all
    customers
  end

  def random
    customers.sample
  end

  def find_by_id(id)
    customers.find { |customer| customer.id == id }
  end

  def find_all_by_id(id)
    customers.select { |customer| customer.id == id }
  end

  def find_by_first_name(first_name)
    customers.find { |customer| customer.first_name.downcase == first_name.downcase }
  end

  def find_all_by_first_name(first_name)
    customers.select { |customer| customer.first_name.downcase == first_name.downcase }
  end

  def find_by_last_name(last_name)
    customers.find { |customer| customer.last_name == last_name }
  end

  def find_all_by_last_name(last_name)
    customers.select { |customer| customer.last_name == last_name }
  end

  def find_by_created_at(created_at)
    merchants.find { |customer| customer.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    merchants.select { |customer| customer.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    customers.find { |customer| customer.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    customers.select { |customer| customer.updated_at == updated_at }
  end

end
