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
    # Total revenue = unit price * quantity
    #needs to only work for successful invoices
  end

  def successful_invoices
    invoices.select do |invoice|
      invoice.transactions.result == "success"
    end
  end

end
