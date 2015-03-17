class Item

  attr_reader :repository,
              :unit_price,
              :merchant_id,
              :id,
              :description,
              :created_at,
              :name,
              :updated_at

  def initialize(data, repository)
    @repository  = repository
    @id          = data[:id].to_i
    @name        = data[:name]
    @description = data[:description]
    @unit_price  = data[:unit_price].to_i
    @merchant_id = data[:merchant_id].to_i
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
  end

  def invoice_items
    repository.find_invoice_items(id)
  end

  def merchant
    repository.find_merchant(merchant_id)
  end

end
