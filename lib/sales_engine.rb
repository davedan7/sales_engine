require 'csv'
require_relative 'merchant_repository'
require_relative 'parser'

class SalesEngine
  #initialize parser that pushes merchant instances to the repo

  include Parser

  def initialize(filepath)
    @filepath = filepath
    @merchant_repository
  end

  def startup
    create_merchant_repository
  end

  def create_merchant_repository
    merchant_data = parse("#{@filepath}/merchants.csv")
    @merchant_repository = MerchantRepository.new(merchant_data, self)
  end

end

