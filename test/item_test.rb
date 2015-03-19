require_relative 'test_helper'
require_relative '../lib/item'

class ItemTest < Minitest::Test

  def setup
    @data = { id: 28,
              name: "Item Quos Dolorum",
              description: "Non rerum quas ullam magni. Porro nemo similique veritatis. Voluptatem recusandae quis minus.",
              unit_price: 15285,
              merchant_id: 2,
              created_at: "2012-03-27 14:53:59 UTC",
              updated_at: "2012-03-27 14:53:59 UTC" }
  end

  def test_it_has_a_default_id
    item = Item.new(@data, nil)

    assert_equal 28, item.id
  end

  def test_item_has_name
    item = Item.new(@data, nil)

    assert_equal "Item Quos Dolorum", item.name
  end

  def test_item_has_description
    item = Item.new(@data, nil)

    assert_equal "Non rerum quas ullam magni. Porro nemo similique veritatis. Voluptatem recusandae quis minus.", item.description
  end

  def test_item_has_unit_price
    item = Item.new(@data, nil)

    assert_equal (BigDecimal.new(15285)/100), item.unit_price
  end

  def test_item_has_merchant_id
    item = Item.new(@data, nil)

    assert_equal 2, item.merchant_id
  end

  def test_item_has_date_of_creation_in_yyyymmdd_hhmms_format
    item = Item.new(@data, nil)

    assert_equal "2012-03-27 14:53:59 UTC", item.created_at
  end

  def test_item_has_updated_date_in_yyymmdd_hhmmss_format
    item = Item.new(@data, nil)

    assert_equal "2012-03-27 14:53:59 UTC", item.updated_at
  end

  def test_it_can_find_invoice_items_by_id
    repository   = FakeRepository.new
    item         = Item.new(@data, repository)
    invoice_item = item.invoice_items

    assert_equal "invoice item 28", invoice_item
  end

  def test_it_can_find_merchant_by_merchant_id
    repository   = FakeRepository.new
    item         = Item.new(@data, repository)
    found_merchant = item.merchant

    assert_equal "merchant 2", found_merchant
  end
end

class FakeRepository
  def find_invoice_items(id)
    "invoice item #{id}"
  end

  def find_merchant(merchant_id)
    "merchant #{merchant_id}"
  end
end
