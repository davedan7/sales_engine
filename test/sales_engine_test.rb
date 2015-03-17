require_relative 'test_helper'
require_relative '../lib/merchant_repository'
require_relative '../lib/merchant'

class SalesEngineTest < Minitest::Test
  include Parser

  def setup
    @engine = SalesEngine.new('./data/')
  end

  def test_it_exists
    assert SalesEngine
  end

  def test_it_creates_merchant_repository_upon_startup
    @engine.startup
    assert @engine.merchant_repository
  end

  def test_it_creates_customer_repository_upon_startup
    @engine.startup
    assert @engine.customer_repository
  end

  def test_it_creates_item_repository_upon_startup
    @engine.startup
    assert @engine.item_repository
  end

  def test_it_creates_transaction_repository_upon_startup
    @engine.startup
    assert @engine.transaction_repository
  end

  def test_it_creates_invoice_repository_upon_startup
    @engine.startup
    assert @engine.invoice_repository
  end

  def test_it_creates_invoice_repository_upon_startup
    @engine.startup
    assert @engine.invoice_item_repository
  end

  def test_it_finds_items_by_merchant_id
    @engine.startup
    items = @engine.find_items_by_merchant_id(2)
    assert_equal 20, items.count
  end

  def test_it_finds_invoices_by_merchant_id
    skip
    @engine.startup
    items = @engine.find_items_by_merchant_id(2)
    assert_equal 20, items.count
  end

end
