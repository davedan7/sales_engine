require_relative 'test_helper'
require_relative '../lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test
  include Parser

  def setup 
    @fixtures = parse("./test/fixtures/transactions.csv")
  end

  def test_it_exists
    assert TransactionRepository.new(@fixtures, nil)
  end

  def test_it_knows_its_parent
    engine        = SalesEngine.new("stub")
    transaction_repo = TransactionRepository.new(@fixtures, engine)
    
    assert_equal engine, transaction_repo.engine
  end

  def test_it_returns_all_transactions
    transaction_repo = TransactionRepository.new(@fixtures, nil)

    refute transaction_repo.all.empty?
  end

  def test_it_returns_random_transaction
    transaction_repo = TransactionRepository.new(@fixtures, nil)

    assert transaction_repo.random
  end

  def test_it_finds_transaction_by_id
    transaction_repo = TransactionRepository.new(@fixtures, nil)
    result           = transaction_repo.find_by_id(2)

    assert_equal "4580251236515201", result.credit_card_number
  end
  # return the cc number ^^^ when searching by id?

  def test_it_finds_all_transactions_by_id
    transaction_repo = TransactionRepository.new(@fixtures, nil)
    result           = transaction_repo.find_all_by_id(6)

    assert_equal 1, result.count
  end

  def test_it_finds_transactions_by_invoice_id
    transaction_repo = TransactionRepository.new(@fixtures, nil)
    result           = transaction_repo.find_by_invoice_id(4)

    assert_equal 3, result.id
  end

  def test_it_finds_all_transactions_by_invoice_id
    transaction_repo = TransactionRepository.new(@fixtures, nil)
    result           = transaction_repo.find_all_by_invoice_id(5)

    assert_equal 1, result.count
  end

  def test_it_finds_transaction_by_credit_card_number
    transaction_repo = TransactionRepository.new(@fixtures, nil)
    result           = transaction_repo.find_by_credit_card_number("4354495077693036")

    assert_equal 3, result.id
  end

  def test_it_finds_all_transaction_by_credit_card_number
    transaction_repo = TransactionRepository.new(@fixtures, nil)
    result           = transaction_repo.find_all_by_credit_card_number("4844518708741275")

    assert_equal 1, result.count
  end

  def test_it_finds_transaction_by_credit_card_expiration_date
    transaction_repo = TransactionRepository.new(@fixtures, nil)
    result           = transaction_repo.find_by_credit_card_expiration_date("")

    assert_equal nil, result
  end

  def test_it_finds_all_transactions_by_credit_card_expiration_date
    transaction_repo = TransactionRepository.new(@fixtures, nil)
    result           = transaction_repo.find_all_by_credit_card_expiration_date("")

    assert_equal [], result
  end

  def test_it_finds_transactions_by_result
    transaction_repo = TransactionRepository.new(@fixtures, nil)
    result           = transaction_repo.find_by_result("success")

    assert_equal 1, result.id
  end

  def test_it_finds_all_transactions_by_result
    transaction_repo = TransactionRepository.new(@fixtures, nil)
    result           = transaction_repo.find_all_by_result("success")

    assert_equal 10, result.count
  end

  def test_it_finds_transaction_by_created_at
    transaction_repo = TransactionRepository.new(@fixtures, nil)
    result           = transaction_repo.find_by_created_at("2012-03-27 14:54:09 UTC")

    assert_equal 1, result.id
  end

  def test_it_finds_all_transactions_by_created_at
    transaction_repo = TransactionRepository.new(@fixtures, nil)
    result           = transaction_repo.find_all_by_created_at("2012-03-27 14:54:09 UTC")

    assert_equal 2, result.count
  end

  def test_it_finds_transactions_by_updated_at
    transaction_repo = TransactionRepository.new(@fixtures, nil)
    result           = transaction_repo.find_by_updated_at("2012-03-27 14:54:10 UTC")

    assert_equal 3, result.id
  end

  def test_it_finds_all_transactions_by_updated_at
    transaction_repo = TransactionRepository.new(@fixtures, nil)
    result           = transaction_repo.find_all_by_updated_at("2012-03-27 14:54:10 UTC")

    assert_equal 8, result.count
  end

  def test_it_finds_invoices_by_id
    engine           = FakeEngine.new
    transaction_repo = TransactionRepository.new(@fixtures, engine)
    invoices         = transaction_repo.find_invoices(5)
    
    assert_equal "test invoice 5", invoices 
  end
end

class FakeEngine
  def find_invoices(invoice_id)
    "test invoice #{invoice_id}"
  end
end


