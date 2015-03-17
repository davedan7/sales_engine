require_relative 'test_helper'
require_relative '../lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test
  include Parser

  def setup 
    @fixtures = parse("./test/fixtures/customers.csv") 
  end

  def test_it_exists
    assert CustomerRepository.new(@fixtures, nil)
  end

  def test_it_knows_its_parent
    engine = SalesEngine.new("stub")
    customer_repo = CustomerRepository.new(@fixtures, engine)
    
    assert_equal engine, customer_repo.engine
  end

  def test_it_returns_all_customers
    customer_repo = CustomerRepository.new(@fixtures, nil)

    refute customer_repo.all.empty?
  end

  def test_it_returns_random_customer
    customer_repo = CustomerRepository.new(@fixtures, nil)

    assert customer_repo.random
  end

  def test_it_can_find_customer_by_id
    customer_repo = CustomerRepository.new(@fixtures, nil)
    result        = customer_repo.find_by_id(2)

    assert_equal "Cecelia", result.first_name
    assert_equal "Osinski", result.last_name
  end

  def test_it_can_find_all_customers_by_id
    customer_repo = CustomerRepository.new(@fixtures, nil)
    result        = customer_repo.find_all_by_id(4)

    assert_equal 1, result.count
  end

  def test_it_can_find_customer_by_first_name
    customer_repo = CustomerRepository.new(@fixtures, nil)
    result        = customer_repo.find_by_first_name("Leanne")

    assert_equal 4, result.id
  end

  def test_it_can_find_customer_by_last_name
    customer_repo = CustomerRepository.new(@fixtures, nil)
    result        = customer_repo.find_by_last_name("Braun")

    assert_equal 4, result.id
  end

  def test_it_can_find_all_by_first_name
    customer_repo = CustomerRepository.new(@fixtures, nil)
    result        = customer_repo.find_all_by_first_name("Parker")

    assert_equal 1, result.count
  end

  def test_it_can_find_all_by_last_name
    customer_repo = CustomerRepository.new(@fixtures, nil)
    result        = customer_repo.find_all_by_last_name("Daugherty")

    assert_equal 1, result.count 
  end

  def test_it_can_find_by_created_at
    customer_repo = CustomerRepository.new(@fixtures, nil)
    result        = customer_repo.find_by_created_at("2012-03-27 14:54:09 UTC")

    assert_equal 1, result.id
  end

  def test_it_can_find_all_by_created_at
    customer_repo = CustomerRepository.new(@fixtures, nil)
    result        = customer_repo.find_all_by_created_at("2012-03-27 14:54:10 UTC")

    assert_equal 6, result.count
  end

  def test_it_can_find_by_updated_at
    customer_repo = CustomerRepository.new(@fixtures, nil)
    result        = customer_repo.find_by_updated_at("2012-03-27 14:54:09 UTC")

    assert_equal 1, result.id
  end

  def test_it_can_find_all_by_updated_at
    customer_repo = CustomerRepository.new(@fixtures, nil)
    result        = customer_repo.find_all_by_updated_at("2012-03-27 14:54:11 UTC")

    assert_equal 3, result.count
  end

  def test_it_finds_invoices_by_id
    engine        = FakeEngine.new
    customer_repo = CustomerRepository.new(@fixtures, engine)
    invoices      = customer_repo.find_invoices(3)
    assert_equal "test invoice 3", invoices 
  end
end

class FakeEngine
  def find_invoices_by_customer_id(id)
    "test invoice #{id}"
  end
end