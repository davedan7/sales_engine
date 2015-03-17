require_relative 'transaction'
require_relative 'parser'

class TransactionRepository

  attr_reader :transactions, :engine

  def initialize(data, engine)
    @engine = engine
    @transactions = data.map { |line| Transaction.new(line, self) }
  end

  def inspect
    "#<{self.class} #{@items.size} rows>"
  end

  def all
    transactions
  end

  def random
    transactions.sample
  end

  def find_by_id(id)
    transactions.find { |transaction| transaction.id == id }
  end

  def find_all_by_id(id)
    transactions.select { |transaction| transaction.id == id }
  end

  def find_by_invoice_id(invoice_id)
    transactions.find { |transaction| transaction.invoice_id == invoice_id }
  end

  def find_all_by_invoice_id(invoice_id)
    transactions.select { |transaction| transaction.invoice_id == invoice_id }
  end

  def find_by_credit_card_number(credit_card_number)
    transactions.find { |transaction| transaction.credit_card_number.downcase == credit_card_number.downcase }
  end

  def find_all_by_credit_card_number(credit_card_number)
    transactions.select { |transaction| transaction.credit_card_number.downcase == credit_card_number.downcase }
  end
  def find_by_credit_card_expiration_date(credit_card_expiration_date)
    transactions.find { |transaction| transaction.credit_card_expiration_date == credit_card_expiration_date }
  end

  def find_all_by_credit_card_expiration_date(credit_card_expiration_date)
    transactions.select { |transaction| transaction.credit_card_expiration_date == credit_card_expiration_date }
  end

  def find_by_result(result)
    transactions.find { |transaction| transaction.result == result }
  end

  def find_all_by_result(result)
    transactions.select { |transaction| transaction.result == result }
  end

  def find_by_created_at(created_at)
    transactions.find { |transaction| transaction.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    transactions.select { |transaction| transaction.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    transactions.find { |transaction| transaction.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    transactions.select { |transaction| transaction.updated_at == updated_at }
  end

  def find_invoice(invoice_id)
    engine.find_invoice_by_id(invoice_id)
  end

end
