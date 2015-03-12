require 'csv'

class Merchant

  #id, name, created_at, updated_at

  attr_reader :id,
              :name,
              :created_at,
              :updated_at

  def initialize(data, repository)
    @id          = data[:id].to_i
    @name        = data[:name]
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
    @repositiory = repository
  end

end
