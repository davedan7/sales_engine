require_relative 'merchant'
require_relative 'parser'

class MerchantRepository

  attr_reader :merchants

  include Parser

  def initialize(data, engine)
    # needs to store all merchant data as instances in an array (use map?)
    # needs to reference the engine
    @engine    = engine
    @merchants = data.map { |line| Merchant.new(line, self) }
  end

# Inspect is needed to run spec harness. Will need one for every class
  def inspect
    "#<{self.class} #{merchants.size} rows>"
  end

end
