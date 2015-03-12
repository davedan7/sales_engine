require 'csv'
require_relative 'merchant_repository'
require_relative 'parser'

class SalesEngine
  #initialize parser that pushes merchant instances to the repo

  attr_reader :merchant_repository,
              :customer_repository,
              :item_repository,
              :transaction_repository

  include Parser

  def initialize(filepath)
    @filepath = filepath
  end

  def startup
    create_merchant_repository
    create_customer_repository
    create_item_repository
    create_transaction_repository
  end

  def create_merchant_repository
    merchant_data        = parse("#{@filepath}/merchants.csv")
    @merchant_repository = MerchantRepository.new(merchant_data, self)
  end

  def create_customer_repository
    customer_data        = parse("#{@filepath}/customers.csv")
    @customer_repository = CustomerRepository.new(customer_data, self)
  end

  def create_item_repository
    item_data        = parse("#{@filepath}/items.csv")
    @item_repository = ItemRepository.new(item_data, self)
  end

  def create_transaction_repository
    transaction_data = parse("#{@filepath}/transactions.csv")
    @transaction_repository = TransactionRepository.new(transaction_data, self)
  end
end
