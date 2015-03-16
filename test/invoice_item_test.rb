require_relative 'test_helper'
require_relative '../lib/invoice_item'

class InvoiceItemTest < Minitest::Test

  def setup
    @data = { id:         2,
              item_id:    539,
              invoice_id: 1,
              quantity:   5,
              unit_price: 13635,
              created_at: "2012-03-27 14:54:09 UTC",
              updated_at: "2012-03-27 14:54:09 UTC" }
  end

  def test_invoice_item_has_an_id
    invoice_item = InvoiceItem.new(@data, nil)

    assert_equal 2, invoice_item.id
  end

  def test_invoice_item_has_an_item_id
    invoice_item = InvoiceItem.new(@data, nil)

    assert_equal 539, invoice_item.item_id
  end

  def test_invoice_item_has_a_invoice_id
    invoice_item = InvoiceItem.new(@data, nil)

    assert_equal 1, invoice_item.invoice_id
  end

  def test_invoice_item_has_quantity
    invoice_item = InvoiceItem.new(@data, nil)

    assert_equal 5, invoice_item.quantity
  end

  def test_invoice_item_has_a_unit_price
    invoice_item = InvoiceItem.new(@data, nil)
    
    assert_equal 13635, invoice_item.unit_price
  end

  def test_invoice_item_has_date_of_creation_in_yyyymmdd_hhmmss_format
    invoice_item = InvoiceItem.new(@data, nil)

    assert_equal "2012-03-27 14:54:09 UTC", invoice_item.created_at
  end

  def test_invoice_item_has_update_date_in_yyyymmdd_hhmmss_format
    invoice_item = InvoiceItem.new(@data, nil)

    assert_equal "2012-03-27 14:54:09 UTC", invoice_item.updated_at
  end
end
