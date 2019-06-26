class InvoiceDetail < ApplicationRecord
  belongs_to :invoice
  belongs_to :product

  delegate :name, :unit, to: :product, prefix: true

  after_create :set_price

  def total_price
    price * quantity
  end

  private

  def set_price
    self.price = product.price
    save!
  end
end
