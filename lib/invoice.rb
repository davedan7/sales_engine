class Invoice
  attr_reader :repository,
              :updated_at,
              :id,
              :created_at,
              :status,
              :merchant_id,
              :customer_id

  def initialize(data, repository)
    @repository   = repository
    @id           = data[:id].to_i
    @customer_id  = data[:customer_id].to_i
    @merchant_id  = data[:merchant_id].to_i
    @status       = data[:status]
    @created_at   = data[:created_at]
    @updated_at   = data[:updated_at]
  end

  def transactions
    repository.find_transactions(id)
  end

  def invoice_items
    repository.find_invoice_items(id)
  end


  # need to get this running
  # def items
  #   invoice_items.map { |invoice_item| invoice_item.item }
  # end

  def customer
    respository.find_customer(id)
  end

  def merchant
    repository.find_merchant(id)
  end
end
