require_relative 'test_helper'
require_relative '../lib/invoice'

class InvoicesTest < Minitest::Test

  def setup
    @data = { id:          2,
              customer_id: 1,
              merchant_id: 75,
              status:      "shipped",
              created_at:  "2012-03-25 09:54:09 UTC",
              updated_at:  "2012-03-25 09:54:09 UTC", }
  end

  def test_invoice_has_id
    invoice = Invoice.new(@data, nil)

    assert_equal 2, invoice.id
  end

  def test_invoice_has_customer_id
    invoice = Invoice.new(@data, nil)

    assert_equal 1, invoice.customer_id
  end

  def test_invoice_has_merchant_id
    invoice = Invoice.new(@data, nil)

    assert_equal 75, invoice.merchant_id
  end

  def test_invoice_has_status
    invoice = Invoice.new(@data, nil)

    assert_equal "shipped", invoice.status
  end

  def test_invoice_has_date_of_creation_in_yyyymmdd_hhmmss_format
    invoice = Invoice.new(@data, nil)

    assert_equal "2012-03-25 09:54:09 UTC", invoice.created_at
  end

  def test_invoice_has_update_date_in_yyyymmdd_hhmmss_format
    invoice = Invoice.new(@data, nil)

    assert_equal "2012-03-25 09:54:09 UTC", invoice.updated_at
  end

  def test_it_can_find_transactions
    repository  = FakeRepository.new
    invoice     = Invoice.new(@data, repository)
    transaction = invoice.transactions

    assert_equal "transaction 2", transaction
  end

  def test_it_finds_invoice_items
    repository   = FakeRepository.new
    invoice      = Invoice.new(@data, repository)
    item         = invoice.invoice_items

    assert_equal "invoice item 2", item
  end

  def test_it_finds_customer_by_customer_id
    repository   = FakeRepository.new
    invoice      = Invoice.new(@data, repository)
    customer     = invoice.customer

    assert_equal "customer 1", customer
  end

  def test_it_finds_merchant_by_merchant_id
    repository   = FakeRepository.new
    invoice      = Invoice.new(@data, repository)
    merchant     = invoice.merchant

    assert_equal "merchant 75", merchant
  end
end

class FakeRepository
  def find_transactions(id)
    "transaction #{id}"
  end

  def find_invoice_items(id)
    "invoice item #{id}"
  end

  def find_customer(customer_id)
    "customer #{customer_id}"
  end

  def find_merchant(merchant_id)
    "merchant #{merchant_id}"
  end
end
