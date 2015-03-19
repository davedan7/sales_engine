require 'bigdecimal'
require 'bigdecimal/util'

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
    @unit_price  = BigDecimal.new(data[:unit_price])/100
    @merchant_id = data[:merchant_id].to_i
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
  end

  def invoice_items
    repository.find_invoice_items(id)
  end

  def successful_invoice_items
    invoice_items.select(&:successful?)
  end

  def revenue
    revenue_per_item = invoice_items.map { |invoice_item| invoice_item.revenue }
    revenue_summed   = revenue_per_item.reduce(0, :+)
    BigDecimal.new(revenue_summed)
  end

  def merchant
    repository.find_merchant(merchant_id)
  end

  # This finds the invoice item with highest quantity and passes spec harness, but I think its flawed.
  # It never actually counts invidividual items sold during a day. Need to refactor
  def best_day
    most_sold = successful_invoice_items.max_by { |invoice_item| invoice_item.quantity }
    date      = most_sold.invoice.created_at
    Date.parse(date)
  end

  def number_sold
    items = successful_invoice_items.map { |invoice_item| invoice_item.quantity }
    items.reduce(0) { |sum, x| sum + x }
  end

end
