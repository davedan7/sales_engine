class Transaction
  
  attr_reader :repository,
              :credit_card_expiration_date,
              :result,
              :id,
              :credit_card_number,
              :created_at,
              :invoice_id,
              :updated_at

  def initialize(data, repository)
    @repository                  = repository
    @id                          = data[:id]
    @invoice_id                  = data[:invoice_id]
    @credit_card_number          = data[:credit_card_number]
    @credit_card_expiration_date = data[:credit_card_expiration_date]
    @result                      = data[:result]
    @created_at                  = data[:created_at]
    @updated_at                  = data[:updated_at]
  end

end
