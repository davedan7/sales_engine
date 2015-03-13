class Invoice
  attr_reader :repository,
              :updated_at,
              :created_at,
              :status,
              :merchant_id,
              :customer_id

  def initialize(data, repository)
    @repository   = repository
    @customer_id  = data[:customer_id].to_i
    @merchant_id  = data[:merchant_id].to_i
    @status       = data[:status]
    @created_at   = data[:created_at]
    @updated_at   = data[:updated_at]
  end

end
