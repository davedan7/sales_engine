require_relative 'transaction'
require_relative 'parser'

class TransactionRepository

  def initialize(data, engine)
    @engine = engine
    @transactions = data.map { |line| Transaction.new(line, self) }
  end

  def inspect
    "#<{self.class} #{@items.size} rows>"
  end

  def all
    transactions
  end

  def random
    transactions.sample
  end

end
