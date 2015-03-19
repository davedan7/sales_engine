require_relative 'invoice_item'
require_relative 'parser'

class InvoiceItemRepository

  attr_reader :invoice_items, :engine

  def initialize(data, engine)
    @engine = engine
    @invoice_items = data.map { |line| InvoiceItem.new(line, self) }
  end

  def inspect
    "#<{self.class} #{@invoice_items.size} rows>"
  end

  def all
    invoice_items
  end

  def random
    invoice_items.sample
  end

  def find_by_id(id)
    invoice_items.find { |invoice_item| invoice_item.id == id }
  end

  def find_all_by_id(id)
    invoice_items.select { |invoice_item| invoice_item.id == id }
  end

  def find_by_item_id(item_id)
    invoice_items.find { |invoice_item| invoice_item.item_id == item_id}
  end

  def find_all_by_item_id(item_id)
    invoice_items.select { |invoice_item| invoice_item.item_id == item_id }
  end

  def find_by_invoice_id(invoice_id)
    invoice_items.find { |invoice_item| invoice_item.invoice_id == invoice_id }
  end

  def find_all_by_invoice_id(invoice_id)
    invoice_items.select { |invoice_item| invoice_item.invoice_id == invoice_id }
  end

  def find_by_quantity(quantity)
    invoice_items.find { |invoice_item| invoice_item.quantity == quantity }
  end

  def find_all_by_quantity(quantity)
    invoice_items.select { |invoice_item| invoice_item.quantity == quantity }
  end

  def find_by_unit_price(unit_price)
    invoice_items.find { |invoice_item| invoice_item.unit_price == unit_price }
  end

  def find_all_by_unit_price(unit_price)
    invoice_items.select { |invoice_item| invoice_item.unit_price == unit_price }
  end

  def find_by_created_at(created_at)
    invoice_items.find { |invoice_item| invoice_item.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    invoice_items.select { |invoice_item| invoice_item.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    invoice_items.find { |invoice_item| invoice_item.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    invoice_items.select { |invoice_item| invoice_item.updated_at == updated_at }
  end

  def find_invoice(invoice_id)
   engine.find_invoice_by_invoice_id(invoice_id)
  end

  def find_item(item_id)
   engine.find_item_by_item_id(item_id)
  end

  def create_invoice_item(inputs, id)
    grouped = inputs.inject(Hash.new(0)) { |hash, x| hash[x] += 1 ; hash }
    items = inputs.uniq
    items.each do |item|

      data = {
        :id         => invoice_items.last.id + 1,
        :item_id    => item.id,
        :invoice_id => id,
        :quantity   => grouped[item],
        :unit_price => item.unit_price,
        :created_at => Time.now,
        :updated_at => Time.now
              }
      ii = InvoiceItem.new(data, self)
      invoice_items << ii
    end
  end

  # def find_items_sold(id)
  #   items_by_id = invoice_items.select { |invoice_item| invoice_item.item_id == id }
  #   items_by_id.
  # end

end
