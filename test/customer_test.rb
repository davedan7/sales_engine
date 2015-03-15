require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require_relative '../lib/customer'

class CustomerTest < Minitest::Test

  def setup
    @data = { id: 3,
              first_name: "Mariah",
              last_name: "Toy",
              created_at: "2012-03-27 14:54:10 UTC",
              updated_at: "2012-03-27 14:54:10 UTC" }
  end

  def test_customer_has_id
    customer = Customer.new(data, nil)

    assert_equal 3, customer.id
  end

  def test_customer_has_first_name
    skip
    customer = Customer.new(data, nil)

    assert_equal "Mariah", customer.first_name
  end

  def test_customer_has_last_name
    skip
    customer = Customer.new(data, nil)

    assert_equal "Toy", customer.last_name
  end

  def test_customer_has_date_of_creation_in_yyyymmdd_hhmmss_format
    skip
    customer = Customer.new(data, nil)

    assert_equal "2012-03-27 14:54:10 UTC", customer.created_at
  end

  def test_customer_has_update_date_in_yyyymmdd_hhmmss_format
    skip
    customer = Customer.new(data, nil)

    assert_equal "2012-03-27 14:54:10 UTC", customer.updated_at
  end
end
