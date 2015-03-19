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

    assert_equal (BigDecimal.new(13635)/100), invoice_item.unit_price
  end

  def test_invoice_item_has_date_of_creation_in_yyyymmdd_hhmmss_format
    invoice_item = InvoiceItem.new(@data, nil)

    assert_equal "2012-03-27 14:54:09 UTC", invoice_item.created_at
  end

  def test_invoice_item_has_update_date_in_yyyymmdd_hhmmss_format
    invoice_item = InvoiceItem.new(@data, nil)

    assert_equal "2012-03-27 14:54:09 UTC", invoice_item.updated_at
  end

  def test_it_has_the_expected_initialized_invoice_id
    invoice_item = InvoiceItem.new(@data, nil)

    assert "1", invoice_item.invoice_id
  end

  def test_it_has_the_expected_initialized_quantity
    invoice_item = InvoiceItem.new(@data, nil)

    assert "5", invoice_item.quantity
  end

  def test_it_has_the_expected_initialized_unit_price
    invoice_item = InvoiceItem.new(@data, nil)

    assert "13635", invoice_item.unit_price
  end

  def test_it_has_the_expected_initialized_created_at
    invoice_item = InvoiceItem.new(@data, nil)

    assert "2012-03-27 14:54:09 UTC", invoice_item.created_at
  end

  def test_it_has_the_expected_initialized_updated_at
    invoice_item = InvoiceItem.new(@data, nil)

    assert "2012-03-27 14:54:09 UTC", invoice_item.updated_at
  end

  def test_it_can_talk_to_the_repository_with_invoice
    parent = Minitest::Mock.new
    invoice_item = InvoiceItem.new(@data, parent)
    parent.expect(:find_invoice, [1, 2], [1])
    assert_equal [1, 2], invoice_item.invoice
    parent.verify
  end

  def test_it_can_talk_to_the_repository_with_item
    parent = Minitest::Mock.new
    invoice_item = InvoiceItem.new(@data, parent)
    parent.expect(:find_item, [1, 2], [539])
    assert_equal [1, 2], invoice_item.item
    parent.verify
  end

end
