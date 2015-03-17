require_relative 'test_helper'
require_relative '../lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test
  include Parser

  def setup
    @fixtures = parse("./test/fixtures/merchants.csv")
  end

  def test_it_exists
    assert MerchantRepository.new(@fixtures, nil)
  end

  def test_it_knows_its_parent
    engine = SalesEngine.new("stub")
    merchant_repo = MerchantRepository.new(@fixtures, engine)
    
    assert_equal engine, merchant_repo.engine
  end

  def test_it_returns_all_merchants
    merchant_repo = MerchantRepository.new(@fixtures, nil)
    
    assert merchant_repo.merchants
  end

  def test_it_returns_random_merchants
    merchant_repo = MerchantRepository.new(@fixtures, nil)
    
    assert merchant_repo.random
  end

  def test_it_can_load_merchants_from_csv
    merchant_repo = MerchantRepository.new(@fixtures, nil)
    assert_equal "Schroeder-Jerde", merchant_repo.merchants.first.name

    assert_equal "Bechtelar, Jones and Stokes", merchant_repo.merchants.last.name
  end

  def test_it_can_find_merchants_by_name
    merchant_repo = MerchantRepository.new(@fixtures, nil)
    found         = merchant_repo.find_by_name("Bechtelar, Jones and Stokes")

    assert_equal 10, found.id
  end
end
