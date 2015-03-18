class Merchant

  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repository

  def initialize(data, repository)
    @id          = data[:id].to_i
    @name        = data[:name]
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
    @repository  = repository
  end

  def items
    repository.find_items(id)
  end

  def invoices
    repository.find_invoices(id)
  end

  def revenue(date = nil)
    result = successful_invoices_with_date(date).map { |invoice| invoice.revenue }
    summed = result.reduce(0) { |sum, x| sum + x }
    BigDecimal.new(summed)
  end

  def successful_invoices
    invoices.select do |invoice|
      invoice.transactions.any? { |transaction| transaction.result == "success" }
    end
  end

  def unsuccessful_invoices
    invoices.reject do |invoice|
      invoice.transactions.any? { | transaction| transaction.result == "success"}
    end
  end

  def successful_invoices_with_date(date)
    if date.nil?
      successful_invoices
    else
      successful_invoices.select do |invoice|
        Date.parse(invoice.created_at) == date
      end
    end
  end

  def favorite_customer
    purchasing_customers = successful_invoices.map { |invoice| invoice.customer }
    purchasing_customers.max_by { |customer| purchasing_customers.count(customer) } # max_by occurrance of customer
  end

  def customers_with_pending_invoices
    unsuccessful_invoices.map { | invoice| invoice.customer }
  end

  def items_sold
    successful_invoices.map { |invoice| invoice.items.size }.reduce(:+)
  end

end
