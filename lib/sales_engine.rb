require 'csv'

class SalesEngine
  #initialize parser that pushes merchant instances to the repo

  include Parser

  def initialize(filepath)
    @filepath = filepath
  end

  def startup
    merchant_repo = Parser.parse('./data.merchants.csv)
  end

end
