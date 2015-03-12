require 'csv'

class Merchant

  #id, name, created_at, updated_at

  def initialize(data, repo)
    @id         = data[:id]
    @name       = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

end

