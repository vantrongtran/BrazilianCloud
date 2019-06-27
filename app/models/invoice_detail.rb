class InvoiceDetail < ApplicationRecord
  belongs_to :invoice
  belongs_to :product, -> { with_deleted }

  validates :quantity, presence: true

  delegate :name, :unit, to: :product, prefix: true

  after_create :set_price

  def total_price
    (price || 0) * (quantity || 0)
  end

  private

  def set_price
    self.price = product.price
    save!
  end
end
