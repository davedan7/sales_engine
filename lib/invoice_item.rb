class InvoiceItem

  attr_reader :repository,
              :quantity,
              :unit_price,
              :id,
              :invoice_id,
              :created_at,
              :item_id
              :updated_at

  def initialize(data, repository)
    @repository  = repository
    @id          = data[:id]
    @item_id     = data[:item_id]
    @invoice_id  = data[:invoice_id]
    @quantity    = data[:quantity]
    @unit_price  = data[:unit_price]
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
  end

end
