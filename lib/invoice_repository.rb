require_relative 'invoice'
require_relative 'parser'

class InvoiceRepository

  attr_reader :invoices, :engine

  include Parser

  def initialize(data, engine)
    @engine     = engine
    @invoices   = data.map { |line| Invoice.new(line, self) }
  end

  def inspect
    "#<{self.class} #{@invoices.size} rows>"
  end

  def all
    invoices
  end

  def random
    invoices.sample
  end

  def find_by_id(id)
    invoices.find { |invoice| invoice.id == id }
  end

  def find_all_by_id(id)
    invoices.select { |invoice| invoice.id == id }
  end

  def find_by_customer_id(customer_id)
    invoices.find { |invoice| invoice.customer_id == customer_id }
  end

  def find_all_by_customer_id(customer_id)
    invoices.select { |invoice| invoice.customer_id == customer_id }
  end

  def find_by_merchant_id(merchant_id)
    invoices.find { |invoice| invoice.merchant_id == merchant_id }
  end

  def find_all_by_merchant_id(merchant_id)
    invoices.select { |invoice| invoice.merchant_id == merchant_id }
  end

  def find_by_status(status)
    invoices.find { |invoice| invoice.status == status }
  end

  def find_all_by_status(status)
    invoices.select { |invoice| invoice.status == status }
  end

  def find_by_created_at(created_at)
    invoices.find { |invoice| invoice.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    invoices.select { |invoice| invoice.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    invoices.find { |invoice| invoice.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    invoices.select { |invoice| invoice.updated_at == updated_at }
  end

  def find_transactions(id)
    engine.find_transactions_by_invoice_id(id)
  end

  def find_invoice_items(id)
    engine.find_invoice_items_by_invoice_id(id)
  end

  def find_customer(customer_id)
    engine.find_customer_by_customer_id(customer_id)
  end

  def find_merchant(id)
    engine.find_merchant_by_merchant_id(id)
  end
end
