require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
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
end
