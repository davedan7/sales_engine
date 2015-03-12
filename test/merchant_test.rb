require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require_relative '../lib/merchant'


class MerchantTest < Minitest::Test

  def setup
    @data = { id: 1,
              name: "Tillman Group",
              created_at: "2012-03-27 14:54:00 UTC",
              updated_at: "2012-03-27 14:54:00 UTC" }
  end

  def test_merchant_has_a_default_id
    skip
    merchant = Merchant.new(data, nil)

    assert_equal 1, merchant.id
  end

  def test_merchant_has_a_name
    skip
    merchant = Merchant.new(data, nil)

    assert_equal "Tillman Group", merchant.name
  end

  def test_merchant_has_a_date_of_creation_in_yyyymmdd_hhmmss_format
    skip
    merchant = Merchant.new(data, nil)

    assert_equal "2012-03-27 14:54:00 UTC", merchant.created_at
  end

  def test_merchant_has_updated_date_in_yyymmdd__hhmmss_format
    skip
    merchant = Merchant.new(data, nil)

    assert_equal "2012-03-27 14:54:00 UTC", merchant.updated_at
  end
end