require_relative 'test_helper'
require_relative '../lib/merchant'


class MerchantTest < Minitest::Test

  def setup
    @data = { id:         1,
              name:       "Tillman Group",
              created_at: "2012-03-27 14:54:00 UTC",
              updated_at: "2012-03-27 14:54:00 UTC" }
  end

  def test_merchant_has_a_default_id
    merchant = Merchant.new(@data, nil)

    assert_equal 1, merchant.id
  end

  def test_merchant_has_a_name
    merchant = Merchant.new(@data, nil)

    assert_equal "Tillman Group", merchant.name
  end

  def test_merchant_has_a_date_of_creation_in_yyyymmdd_hhmmss_format
    merchant = Merchant.new(@data, nil)

    assert_equal "2012-03-27 14:54:00 UTC", merchant.created_at
  end

  def test_merchant_has_updated_date_in_yyymmdd__hhmmss_format
    merchant = Merchant.new(@data, nil)

    assert_equal "2012-03-27 14:54:00 UTC", merchant.updated_at
  end

  def test_it_can_talk_to_the_repository_with_items
    parent = Minitest::Mock.new
    merchant = Merchant.new(@data, parent)
    parent.expect(:find_items, [1, 2], [1])
    assert_equal [1, 2], merchant.items
    parent.verify
  end

  def test_it_can_talk_to_the_repository_with_invoices
    parent = Minitest::Mock.new
    merchant = Merchant.new(@data, parent)
    parent.expect(:find_invoices, [1, 2], [1])
    assert_equal [1, 2], merchant.invoices
    parent.verify
  end

  def test_it_can_find_its_total_revenue
    sales_engine = SalesEngine.new("./data")
    sales_engine.startup

    assert_equal "338055.54", sales_engine.merchant_repository.merchants[2].revenue.to_digits
  end

  def test_it_can_find_its_favorite_customer
    sales_engine = SalesEngine.new("./data")
    sales_engine.startup

    assert_equal "Kuhn", sales_engine.merchant_repository.merchants[50].favorite_customer.last_name
  end

end
