require_relative 'test_helper'
require_relative '../lib/invoice_item_repository'

class InvoiceItemRepositoryTest < Minitest::Test

  include Parser

  def test_it_can_load_data_to_invoice_item
    data = parse("./data/invoice_items.csv")
    invoice_item_repository = InvoiceItemRepository.new(data, nil)

    assert_equal 539, invoice_item_repository.invoice_items.first.item_id
    assert_equal 1, invoice_item_repository.invoice_items.first.id
    assert_equal 2, invoice_item_repository.invoice_items[20].quantity
  end

  def test_it_can_return_all_invoice_items
    data = parse("./data/invoice_items.csv")
    invoice_item_repository = InvoiceItemRepository.new(data, nil)

    refute invoice_item_repository.invoice_items.empty?
  end

  def test_it_can_return_random_sample
    data = parse("./data/invoice_items.csv")
    invoice_item_repository = InvoiceItemRepository.new(data, nil)

    assert invoice_item_repository.random
  end

  def test_it_can_find_by_id
    data = parse("./data/invoice_items.csv")
    invoice_item_repository = InvoiceItemRepository.new(data, nil)
    result = invoice_item_repository.find_by_id(4)

    assert_equal 4, result.id
  end

  def test_it_can_find_by_item_id
    data = parse("./data/invoice_items.csv")
    invoice_item_repository = InvoiceItemRepository.new(data, nil)
    result = invoice_item_repository.find_by_item_id(539)

    assert_equal 539, result.item_id
  end

  def test_it_can_find_by_invoice_id
    data = parse("./data/invoice_items.csv")
    invoice_item_repository = InvoiceItemRepository.new(data, nil)
    result = invoice_item_repository.find_by_invoice_id(1)

    assert_equal 1, result.invoice_id
  end

  def test_it_can_find_by_quantity
    data = parse("./data/invoice_items.csv")
    invoice_item_repository = InvoiceItemRepository.new(data, nil)
    result = invoice_item_repository.find_by_quantity(9)

    assert_equal 9, result.quantity
  end

  def test_it_can_find_by_unit_price
    data = parse("./data/invoice_items.csv")
    invoice_item_repository = InvoiceItemRepository.new(data, nil)
    result = invoice_item_repository.find_by_unit_price(BigDecimal.new(23324)/100)

    assert_equal "233.24", result.unit_price.to_digits
  end

  def test_it_can_find_by_created_at
    data = parse("./data/invoice_items.csv")
    invoice_item_repository = InvoiceItemRepository.new(data, nil)
    result = invoice_item_repository.find_by_created_at("2012-03-27 14:54:09 UTC")

    assert_equal "2012-03-27 14:54:09 UTC", result.created_at
  end

  def test_it_can_find_by_updated_at
    data = parse("./data/invoice_items.csv")
    invoice_item_repository = InvoiceItemRepository.new(data, nil)
    result = invoice_item_repository.find_by_updated_at("2012-03-27 14:54:09 UTC")

    assert_equal "2012-03-27 14:54:09 UTC", result.updated_at
  end

  def test_it_can_find_all_by_id
    data = parse("./data/invoice_items.csv")
    invoice_item_repository = InvoiceItemRepository.new(data, nil)
    result = invoice_item_repository.find_all_by_id(4)

    assert_equal 1, result.count
  end

  def test_it_can_find_all_by_item_id
    data = parse("./data/invoice_items.csv")
    invoice_item_repository = InvoiceItemRepository.new(data, nil)
    result = invoice_item_repository.find_all_by_item_id(523)

    assert_equal 10, result.count
  end

  def test_it_can_find_all_by_invoice_id
    data = parse("./data/invoice_items.csv")
    invoice_item_repository = InvoiceItemRepository.new(data, nil)
    result = invoice_item_repository.find_all_by_invoice_id(1)

    assert_equal 8, result.count
  end

  def test_it_can_find_all_by_quantity
    data = parse("./data/invoice_items.csv")
    invoice_item_repository = InvoiceItemRepository.new(data, nil)
    result = invoice_item_repository.find_all_by_quantity(7)

    assert_equal 2181, result.count
  end

  def test_it_can_find_all_by_unit_price
    data = parse("./data/invoice_items.csv")
    invoice_item_repository = InvoiceItemRepository.new(data, nil)
    result = invoice_item_repository.find_all_by_unit_price(BigDecimal.new(72018)/100)

    assert_equal 33, result.count
  end

  def test_it_can_find_all_by_created_at
    data = parse("./data/invoice_items.csv")
    invoice_item_repository = InvoiceItemRepository.new(data, nil)
    result = invoice_item_repository.find_all_by_created_at("2012-03-27 14:54:10 UTC")

    assert_equal 97, result.count
  end

  def test_it_can_find_all_by_updated_at
    data = parse("./data/invoice_items.csv")
    invoice_item_repository = InvoiceItemRepository.new(data, nil)
    result = invoice_item_repository.find_all_by_updated_at("2012-03-27 14:54:10 UTC")

    assert_equal 97, result.count
  end

end
