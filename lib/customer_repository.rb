require_relative 'customers'
require_relative 'parser'

class CustomerRepository

  attr_reader :customers

  include Parser

  def initialize(data, engine)
    @engine    = engine
    @customers = data.map { |line| Merchant.new(line, self) }
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

end
