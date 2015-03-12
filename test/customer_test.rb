require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require_relative 'customer'

class CustomerTest < Minitest::Test

  def test_customer_has_id
    skip
    customer = Customer.new(customer_id)

    assert_equal "0000", customer.customer_id
  end

  def test_customer_has_first_name
    skip
    customer = Customer.new(customer_id, first_name)

    assert_equal "John", customer.first_name
  end

  def test_customer_has_last_name
    skip
    customer = Customer.new(customer_id, first_name, last_name)

    assert_equal "Doe", customer.last_name
  end

  def test_customer_has_date_of_creation_in_yyyymmdd_format
    skip
    customer = Customer.new(customer_id, first_name, last_name, created_at)

    assert_equal "2012-03-27", customer.created_at
  end

  def test_customer_has_time_of_creation_in_hhmmss_UTC_format
    skip
    customer = Customer.new(customer_id, first_name, last_name, created_at)
    
    assert_equal "2012-03-27 14:54:10", customer.created_at
  end

  def test_customer_has_update_date_in_yyyymmdd_format
    skip
    customer = Customer.new(customer_id, first_name, last_name, created_at, updated_at)

    assert_equal "2012-03-27", customer.updated_at
  end

  def test_customer_has_update_time_in_hhmmss_UTC_format
    skip
    customer = Customer.new(customer_id, first_name, last_name, created_at, updated_at)

    assert_equal "2012-03-27 14:54:10", customer.updated_at
  end
end
