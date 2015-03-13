require_relative 'invoice_item'
require_relative 'parser'

class InvoiceItemRepository

  attr_reader :invoice_items

  def initialize(data, engine)
    @engine = engine
    @invoice_items = data.map { |line| InvoiceItem.new(line, self) }
  end

  def inspect
    "#<{self.class} #{@invoice_items.size} rows>"
  end

end
