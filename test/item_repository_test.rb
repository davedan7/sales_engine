require_relative 'test_helper'
require_relative '../lib/invoice_repository'
require_relative '../lib/item_repository'

class ItemRepositoryTest < Minitest::Test
  include Parser

  def setup 
    @fixtures = parse("./test/fixtures/invoices.csv") 
  end

  def test_it_exists
    assert ItemRepository.new(@fixtures, nil)
  end


  def test_it_knows_its_parent
    engine    = SalesEngine.new("stub")
    item_repo = ItemRepository.new(@fixtures, engine)

    assert_equal engine, item_repo.engine
  end


  def test_it_returns_all_item
    item_repo = ItemRepository.new(@fixtures, nil)

    refute item_repo.all.empty?
  end


  def test_it_returns_random_items
    item_repo = ItemRepository.new(@fixtures, nil)

    assert item_repo.random
  end

  def test_it_can_find_by_id
    item_repo = ItemRepository.new(@fixtures, nil)
    result    = item_repo.find_by_id(1)

    assert_equal 1, result.id
  end


  def test_it_can_find_all_by_id
    item_repo = ItemRepository.new(@fixtures, nil)
    result    = item_repo.find_all_by_id(4)

    assert_equal 1, result.count
  end

  def test_it_can_find_by_name
    skip
    item_repo = ItemRepository.new(@fixtures, nil)
    result    = item_repo.find_by_name("Item Autem Minima")

    assert_equal 2, result.id
  end

  def test_it_can_find_all_by_name
    skip
    item_repo = ItemRepository.new(@fixtures, nil)
    result    = item_repo.find_all_by_name("Item Autem Minima")

    assert_equal 1, result.count
  end

  def test_it_can_find_by_desription
    skip
    item_repo = ItemRepository.new(@fixtures, nil)
    result    = item_repo.find_by_description("Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.")

    assert_equal 4, result.id
  end

  def test_it_can_find_all_by_description
    skip
    item_repo = ItemRepository.new(@fixtures, nil)
    result    = item_repo.find_all_by_description("Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.")

    assert_equal 1, result.count
  end

  def test_it_can_find_by_unit_price
    skip
    item_repo = ItemRepository.new(@fixtures, nil)
    result    = item_repo.find_by_unit_price(67076)

    assert_equal 2, result.id
  end

  def test_it_can_find_all_by_unit_price
    skip
    item_repo = ItemRepository.new(@fixtures, nil)
    result    = item_repo.find_all_by_unit_price(4291)

    assert_equal 1, result.count
  end

  def test_it_can_find_by_merchant_id
    skip 
    item_repo = ItemRepository.new(@fixtures, nil)
    result    = item_repo.find_by_merchant_id(1)

    assert_equal "", result.id
  end

  def test_it_can_find_all_by_merchant_id
    skip
    item_repo = ItemRepository.new(@fixtures, nil)
    result    = item_repo.find_all_by_merchant_id(1)

    assert_equal 10, result.count
  end

  def test_it_can_find_by_created_at
    skip
    item_repo = ItemRepository.new(@fixtures, nil)
    result    = item_repo.find_by_created_at("2012-03-27 14:53:59 UTC")

    assert_equal 1, result.id
  end

  def test_it_can_find_all_by_created_at
    skip
    item_repo = ItemRepository.new(@fixtures, nil)
    result    = item_repo.find_all_by_created_at("2012-03-27 14:53:59 UTC")

    assert_equal 10, result.count
  end

  def test_it_can_find_by_updated_at
    skip
    item_repo = ItemRepository.new(@fixtures, nil)
    result    = item_repo.find_by_updated_at("2012-03-27 14:53:59 UTC")

    assert_equal 4, result.id
  end

  def test_it_can_find_all_by_updated_at
    skip
    item_repo = ItemRepository.new(@fixtures, nil)
    result    = item_repo.find_all_by_updated_at("2012-03-27 14:53:59 UTC")

    assert_equal 10, result.count
  end
end
