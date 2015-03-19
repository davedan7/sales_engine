require_relative 'test_helper'
require_relative '../lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test
  include Parser

  def setup
    @fixtures = parse("./test/fixtures/invoices.csv")
  end

  def test_it_exits
    assert InvoiceRepository.new(@fixtures, nil)
  end

  def test_it_knows_its_parent
    engine       = SalesEngine.new("stub")
    invoice_repo = InvoiceRepository.new(@fixtures, engine)

    assert_equal engine, invoice_repo.engine
  end

  def test_it_returns_all_invoices
    invoice_repo = InvoiceRepository.new(@fixtures, nil)

    refute invoice_repo.all.empty?
  end

  def test_it_returns_random_invoices
    invoice_repo = InvoiceRepository.new(@fixtures, nil)

    assert invoice_repo.random
  end

  def test_it_can_find_by_id
    invoice_repo = InvoiceRepository.new(@fixtures, nil)
    result       = invoice_repo.find_by_id(1)

    assert_equal 1, result.id
  end

  def test_it_can_find_all_by_id
    invoice_repo = InvoiceRepository.new(@fixtures, nil)
    result       = invoice_repo.find_all_by_id(4)

    assert_equal 1, result.count
  end

  def test_it_can_produce_random_sample
    invoice_repo = InvoiceRepository.new(@fixtures, nil)
    sample = invoice_repo.random
    assert sample
  end

  def test_it_can_find_by_customer_id
    invoice_repo = InvoiceRepository.new(@fixtures, nil)
    result       = invoice_repo.find_by_customer_id(2)

    assert_equal 9, result.id
  end

  def test_it_can_find_all_by_customer_id
    invoice_repo = InvoiceRepository.new(@fixtures, nil)
    result       = invoice_repo.find_all_by_customer_id(1)

    assert_equal 8, result.count
  end

  def test_it_can_find_by_merchant_id
    invoice_repo = InvoiceRepository.new(@fixtures, nil)
    result       = invoice_repo.find_by_merchant_id(33)

    assert_equal 4, result.id
  end

  def test_it_can_find_all_by_merchant_id
    invoice_repo = InvoiceRepository.new(@fixtures, nil)
    result       = invoice_repo.find_all_by_merchant_id(26)

    assert_equal 1, result.count
  end

  def test_it_can_find_by_status
    invoice_repo = InvoiceRepository.new(@fixtures, nil)
    result       = invoice_repo.find_by_status("shipped")

    assert_equal 1, result.id
  end

  def test_it_can_find_all_by_status
    invoice_repo = InvoiceRepository.new(@fixtures, nil)
    result       = invoice_repo.find_all_by_status("shipped")

    assert_equal 10, result.count
  end

  def test_it_can_find_by_created_at
    invoice_repo = InvoiceRepository.new(@fixtures, nil)
    result       = invoice_repo.find_by_created_at "2012-03-09 01:54:10 UTC"

    assert_equal 6, result.id
  end

  def test_it_can_find_all_by_created_at
    invoice_repo = InvoiceRepository.new(@fixtures, nil)
    result       = invoice_repo.find_all_by_created_at "2012-03-09 01:54:10 UTC"

    assert_equal 1, result.count
  end

  def test_it_can_find_by_updated_at
    invoice_repo = InvoiceRepository.new(@fixtures, nil)
    result       = invoice_repo.find_by_updated_at "2012-03-10 00:54:09 UTC"

    assert_equal 3, result.id
  end

  def test_it_can_find_all_by_updated_at
    invoice_repo = InvoiceRepository.new(@fixtures, nil)
    result       = invoice_repo.find_all_by_updated_at "2012-03-09 01:54:10 UTC"

    assert_equal 1, result.count
  end

  def test_it_finds_transactions_by_invoice_id
    engine       = FakeEngine.new
    invoice_repo = InvoiceRepository.new(@fixtures, engine)
    transaction  = invoice_repo.find_transactions(1)

    assert_equal "transaction id number 1", transaction
  end

  def test_it_finds_invoice_items_by_invoice_id
    engine        = FakeEngine.new
    invoice_repo  = InvoiceRepository.new(@fixtures, engine)
    invoice_items  = invoice_repo.find_invoice_items(6)

    assert_equal "invoice item 6", invoice_items
  end

  def test_it_finds_customer_by_customer_id
    engine        = FakeEngine.new
    invoice_repo  = InvoiceRepository.new(@fixtures, engine)
    customer      = invoice_repo.find_customer(2)

    assert_equal "customer id 2", customer
  end

  def test_it_finds_merchant_by_merchant_id
    engine        = FakeEngine.new
    invoice_repo  = InvoiceRepository.new(@fixtures, engine)
    merchant      = invoice_repo.find_merchant(2)

    assert_equal "merchant number 2", merchant
  end

end

class FakeEngine
  def find_transactions_by_invoice_id(id)
    "transaction id number #{id}"
  end

  def find_invoice_items_by_invoice_id(id)
    "invoice item #{id}"
  end

  def find_customer_by_customer_id(customer_id)
    "customer id #{customer_id}"
  end

  def find_merchant_by_merchant_id(merchant_id)
    "merchant number #{merchant_id}"
  end
end
