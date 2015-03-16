require_relative 'test_helper'
require_relative '../lib/transaction'

class TransactionTest < Minitest::Test

  def setup
    @data = { id:                          2,
              invoice_id:                  2,
              credit_card_number:          4580251236515201,
              credit_card_expiration_date: "" ,
              result:                      "success",
              created_at:                  "2012-03-27 14:54:09 UTC",
              updated_at:                  "2012-03-27 14:54:09 UTC" }
  end

  def test_transaction_has_id
    transaction = Transaction.new(@data, nil) 

    assert_equal 2, transaction.id
  end

  def test_transaction_has_invoice_id
    transaction = Transaction.new(@data, nil)

    assert_equal 2, transaction.invoice_id
  end

  def test_transaction_has_credit_card_number
    transaction = Transaction.new(@data, nil)

    assert_equal 4580251236515201, transaction.credit_card_number
  end

  def test_transaction_has_credit_card_number_fail_success_outcome
    transaction = Transaction.new(@data, nil)

    assert_equal "success", transaction.result
  end

  def test_transaction_has_date_of_creation_in_yyyymmdd_hhmmss_format
    transaction = Transaction.new(@data,nil)

    assert_equal "2012-03-27 14:54:09 UTC", transaction.created_at
  end

  def test_transaction_has_update_date_in_yyyymmdd_hhmmss_format
    transaction = Transaction.new(@data, nil)

    assert_equal "2012-03-27 14:54:09 UTC", transaction.updated_at
  end
end
