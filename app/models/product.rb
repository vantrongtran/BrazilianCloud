class Product < ApplicationRecord
  acts_as_paranoid
  paginates_per 20

  has_many :invoice_details
  has_many :invoices, through: :invoice_details
  has_many :clients, -> { distinct }, through: :invoices
end
