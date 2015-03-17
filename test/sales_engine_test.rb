require_relative 'test_helper'
require_relative '../lib/merchant_repository'
require_relative '../lib/merchant'

class SalesEngineTest < Minitest::Test
  include Parser

  def setup
    @engine = SalesEngine.new('./test/fixtures')
    @engine.startup
  end

  def test_it_exists
    assert SalesEngine
  end

  def test_it_creates_merchant_repository_upon_startup
    assert @engine.merchant_repository
    assert_equal "Schroeder-Jerde", @engine.merchant_repository.merchants.first.name
    assert_equal "Bechtelar, Jones and Stokes", @engine.merchant_repository.merchants.last.name
  end

  def test_it_creates_customer_repository_upon_startup
    assert @engine.customer_repository
    assert_equal "Joey", @engine.customer_repository.customers.first.first_name
  end

  def test_it_creates_item_repository_upon_startup
    assert @engine.item_repository
    assert_equal "Item Qui Esse", @engine.item_repository.items.first.name
  end

  def test_it_creates_transaction_repository_upon_startup
    assert @engine.transaction_repository
  end

  def test_it_creates_invoice_repository_upon_startup
    assert @engine.invoice_repository
  end

  def test_it_creates_invoice_repository_upon_startup
    assert @engine.invoice_item_repository
  end

  def test_it_finds_items_by_merchant_id
    items = @engine.find_items_by_merchant_id(1)
    assert_equal 20, items.count
  end

  def test_it_finds_invoices_by_merchant_id
    skip
    invoices = @engine.find_invoices_by_merchant_id(3)
    assert_equal 20, invoices.count
  end

end
