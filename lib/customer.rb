class Customer

  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :repository

  def initialize(data, repository)
    @repository = repository
    @id         = data[:id].to_i
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end

  def invoices
    repository.find_invoices(id)
  end

  def transactions
    invoices.map { |invoice| invoice.transactions }
  end

  def successful_invoices
    invoices.select do |invoice|
      invoice.successful?
    end
  end

  def favorite_merchant
    merchants_purchased_from = successful_invoices.group_by { |invoice| invoice.merchant }
    merchants_purchased_from.keys.max
  end

end
