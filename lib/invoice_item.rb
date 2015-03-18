class InvoiceItem

  attr_reader :repository,
              :quantity,
              :unit_price,
              :id,
              :invoice_id,
              :created_at,
              :item_id,
              :updated_at

  def initialize(data, repository)
    @repository  = repository
    @id          = data[:id].to_i
    @item_id     = data[:item_id].to_i
    @invoice_id  = data[:invoice_id].to_i
    @quantity    = data[:quantity].to_i
    @unit_price  = BigDecimal.new(data[:unit_price])/100
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
  end

  def invoice
    repository.find_invoice(invoice_id)
  end

  def item
   repository.find_item(item_id)
  end

  def revenue
    quantity * unit_price
  end

  # def items_sold
  #   quantity *
  # end

end
