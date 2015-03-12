require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require_relative 'item'

class ItemTest < Minitest::Test
  
  def test_it_has_a_default_id
    item = Item.new(item_id)

    assert_equal "0000", item.item_id 
  end

  def test_item_has_name
    skip
    item = Item.new(item_id, item_name)

    assert_equal "no item", item.item_name
  end

  def test_item_has_description
    skip
    item = Item.new(item_id, item_name, item_description)

    assert_equal "unknown", item.item_description
  end

  def test_item_has_unit_price
    skip
    item = Item.new(item_id, item_name, item_description, unit_price)

    assert_equal #not sure how to test for big decimal
  end

  def test_item_has_merchant_id
    skip
    item = Item.new(item_id, item_name, item_description, unit_price, merchant_id)

    assert_equal "000", item.merchant_id #is this right?
  end

  def test_item_has_date_of_creation_in_yyyymmdd_format
    skip
    item = Item.new(item_id, item_name, item_description, unit_price, merchant_id, item_created_at)

    assert_equal "2012-03-27", item.item_created_at
  end

  def test_item_has_a_time_of_creation_in_hhmmss_UTC_format
    skip
    item = Item.new(item_id, item_name, item_description, unit_price, merchant_id, item_created_at)

    assert_equal "2012-03-27 14:53:59 UTC", item.created_at
  end

  def test_item_has_updated_date_in_yyymmdd_format
    skip
    item = Item.new(item_id, item_name, item_description, unit_price, merchant_id, item_created_at, item_updated_at)

    assert_equal "2012-03-27", item.item_updated_at
  end

  def test_merchant_has_updated_time_in_hhmmss_UTC_format
    skip
    item = Item.new(merchant_id, merchant_name, created_at, item_updated_at)

    assert_equal "2012-03-27 14:53:59 UTC", item.item_updated_at
  end
end
