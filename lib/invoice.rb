require 'date'

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

  def successful? #from Jeff's talk
    # transactions.any? { |transaction| transaction.successful? }
    !pending?
  end

  def pending?
    transactions.none?(&:successful?)
  end

  # def successful_invoices
  #   transactions.select { |transaction| transaction.status == "success"}
  # end

  # need tests for this?
  def items
    invoice_items.map { |invoice_item| invoice_item.item }
  end

  def customer
    repository.find_customer(customer_id)
  end

  def merchant
    repository.find_merchant(merchant_id)
  end

  def revenue
    revenue_items = invoice_items.map { |invoice_item| invoice_item.revenue}
    revenue_items.reduce(0) { |sum, x| sum + x }
  end
end
