class Invoice < ApplicationRecord
  belongs_to :client

  has_many :invoice_details, dependent: :destroy
  has_many :products, through: :invoice_details

  accepts_nested_attributes_for :invoice_details, allow_destroy: true

  def product_count
    invoice_details.sum(&:quantity)
  end

  def total_price
    invoice_details.reduce(0) { |sum, invoice_detail| sum + invoice_detail.total_price }
  end
end
