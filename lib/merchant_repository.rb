require_relative 'merchant'

class MerchantRepository
  # needs to have an attribute that points at the sales engine

  attr_reader :merchants

  def initialize(engine)
    # needs to store all merchant data as instances in an array (use map?)
    # needs to reference the engine
    @merchants = []
    @engine = engine
  end

  def merchant_repo_populate
    # push instances of Merchant into the @merchants array
  end

end
