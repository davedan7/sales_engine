require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require_relative '../lib/merchant'


class MerchantTest < Minitest::Test

  def test_merchant_has_a_default_id
    skip
    merchant = Merchant.new(merchant_id)

    assert_equal "000", merchant.merchant_id
  end

  def test_merchant_has_a_name
    skip
    merchant = Merchant.new(merchant_id, merchant_name)

    assert_equal "unknown", merchant.merchant_name
  end

  def test_merchant_has_a_date_of_creation_in_yyyymmdd_format
    skip
    merchant = Merchant.new(merchant_id, merchant_name, created_at)

    assert_equal "2012-03-27", merchant.created_at
  end

  def test_merchant_has_a_time_of_creation_in_hhmmss_UTC_format
    skip
    merchant = Merchant.new(merchant_id, merchant_name, created_at)

    assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
  end

  def test_merchant_has_updated_date_in_yyymmdd_format
    skip
    merchant = Merchant.new(merchant_id, merchant_name, created_at, updated_at)

    assert_equal "2012-03-27", merchant.updated_at
  end
  def test_merchant_has_updated_time_in_hhmmss_UTC_format
    skip
    merchant = Merchant.new(merchant_id, merchant_name, created_at, updated_at)

    assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
  end
end
