require_relative 'merchant'
require_relative 'parser'

class MerchantRepository
  # needs to have an attribute that points at the sales engine

  include Parser

  attr_reader :merchants

  def initialize(data, engine)
    # needs to store all merchant data as instances in an array (use map?)
    # needs to reference the engine
    @engine = engine
    @merchants = data.map { |line| Merchant.new(line, self) }
    # @merchants = []
  end

  def inspect # This is needed to run spec harness. Will need one for every class
    "#<{self.class} #{merchants.size} rows>"
  end

end
