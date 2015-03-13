require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
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
    item = Item.new(@data , nil)

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

    assert_equal 15285, item.unit_price
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
end
