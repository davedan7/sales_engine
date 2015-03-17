require_relative 'test_helper'
require_relative '../lib/merchant_repository'
require_relative '../lib/merchant'
require_relative '../lib/item_repository'
require_relative '../lib/item'
require_relative '../lib/customer_repository'
require_relative '../lib/customer'
require_relative '../lib/invoice_item'
require_relative '../lib/invoice_item_repository'

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
    assert_equal "Item Quidem Suscipit", @engine.item_repository.items.last.name
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
    assert_equal 10, items.count
  end

  def test_it_finds_invoices_by_merchant_id
    invoices = @engine.find_invoices_by_merchant_id(26)
    assert_equal 1, invoices.count
    assert_equal "2012-03-25 09:54:09 UTC", invoices.first.updated_at
  end

  def test_it_finds_transactions_by_invoice_id
    transactions = @engine.find_transactions_by_invoice_id(1)
    assert_equal 1, transactions.count
    assert_equal "4654405418249632", transactions.first.credit_card_number
  end

  def test_it_finds_invoice_items_by_invoice_id
    invoice_items = @engine.find_invoice_items_by_invoice_id(1)
    assert_equal 8, invoice_items.count
    assert_equal 539, invoice_items.first.item_id
  end

  # can't make this work...
  # def test_it_finds_items_by_way_of_invoice_items
  #   items_by_invoice = @engine.find_invoice_items_by_invoice_id(1)
  #   assert_equal 8, items_by_invoice.items.count
  #   # assert_equal 539, items_by_invoice.first.item_id
  # end

  def test_it_finds_customer_by_customer_id
    customer = @engine.find_customer_by_customer_id(1)
    assert_equal "Joey", customer.first_name
    assert_equal "Ondricka", customer.last_name
  end

  def test_it_finds_merchant_by_merchant_id
    merchant = @engine.find_merchant_by_merchant_id(1)
    assert_equal "Schroeder-Jerde", merchant.name
  end

  def test_it_finds_invoice_by_invoice_id_for_invoice_item
    invoice = @engine.find_invoice_by_invoice_id(1)
    assert_equal 1, invoice.customer_id
    assert_equal 26, invoice.merchant_id
    refute_equal 30, invoice.merchant_id
  end

  def test_it_finds_item_by_item_id_for_invoice_item
    item = @engine.find_item_by_item_id(1)
    assert_equal "Item Qui Esse", item.name
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", item.description
  end

  def test_it_finds_invoice_items_by_item_id_for_items
    invoice_items = @engine.find_invoice_items_by_item_id(539)
    assert_equal 1, invoice_items.count
    assert_equal BigDecimal.new(13635)/100, invoice_items.first.unit_price
  end

  def test_it_finds_merchant_by_merchant_id_for_items
    merchant = @engine.find_merchant_by_merchant_id_for_item(1)
    assert_equal "Schroeder-Jerde", merchant.name
    merchant2 = @engine.find_merchant_by_merchant_id_for_item(2)
    assert_equal "Klein, Rempel and Jones", merchant2.name
  end

  def test_it_finds_invoice_by_invoice_id
    invoice = @engine.find_invoice_by_id(1)
    assert_equal 26, invoice.merchant_id
    assert_equal "2012-03-25 09:54:09 UTC", invoice.created_at
  end

end
