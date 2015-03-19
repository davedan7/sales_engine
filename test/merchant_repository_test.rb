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

    refute merchant_repo.all.empty?
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

  def test_it_can_find_by_created_at
    data                = parse("./data/merchants.csv")
    merchant_repository = MerchantRepository.new(data, nil)
    result              = merchant_repository.find_by_created_at("2012-03-27 14:53:59 UTC")

    assert_equal "2012-03-27 14:53:59 UTC", result.created_at
  end

  def test_it_can_find_by_updated_at
    data                = parse("./data/merchants.csv")
    merchant_repository = MerchantRepository.new(data, nil)
    result              = merchant_repository.find_by_updated_at("2012-03-27 14:53:59 UTC")

    assert_equal "2012-03-27 14:53:59 UTC", result.updated_at
  end

  def test_it_can_find_all_by_id
    data                = parse("./data/merchants.csv")
    merchant_repository = MerchantRepository.new(data, nil)
    result              = merchant_repository.find_all_by_id(4)

    assert_equal 1, result.count
  end

  def test_it_can_find_all_by_name
    data                = parse("./data/merchants.csv")
    merchant_repository = MerchantRepository.new(data, nil)
    result              = merchant_repository.find_all_by_name("Brown Inc")

    assert_equal 1, result.count
  end

  def test_it_can_find_all_by_created_at
    data                = parse("./data/merchants.csv")
    merchant_repository = MerchantRepository.new(data, nil)
    result              = merchant_repository.find_all_by_created_at("2012-03-27 14:53:59 UTC")

    assert_equal 9, result.count
  end

  def test_it_can_find_all_by_updated_at
    data                = parse("./data/merchants.csv")
    merchant_repository = MerchantRepository.new(data, nil)
    result              = merchant_repository.find_all_by_updated_at("2012-03-27 14:53:59 UTC")

    assert_equal 8, result.count
  end

  def test_it_can_find_items_by_merchant_id
    engine              = FakeEngine.new
    merchant_repository = MerchantRepository.new(@fixtures, engine)
    item                = merchant_repository.find_items(3)

    assert_equal "item 3", item
  end
end

class FakeEngine
  def find_items_by_merchant_id(id)
    "item #{id}"
  end
end
