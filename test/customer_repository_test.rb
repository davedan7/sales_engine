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
end