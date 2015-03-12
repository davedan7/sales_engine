class Item

  attr_reader :repository,
              :unit_price,
              :merchant_id,
              :id,
              :description,
              :created_at,
              :name
              :updated_at

  def initialize(data, repository)
    @repository  = repository
    @id          = data[:id]
    @name        = data[:name]
    @description = data[:description]
    @unit_price  = data[:unit_price]
    @merchant_id = data[:merchant_id]
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
  end

end
