require_relative 'invoice'
require_relative 'parser'

class InvoiceRepository

  attr_reader :invoices

  include Parser

  def initialize(data, engine)
    @engine     = engine
    @invoices   = data.map { |line| Invoice.new(line, self) }
  end

  def inspect
    "#<{self.class} #{@invoices.size} rows>"
  end

end
