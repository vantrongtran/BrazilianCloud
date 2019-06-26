class Invoice < ApplicationRecord
  belongs_to :client

  has_many :invoice_details, dependent: :destroy
  has_many :products, through: :invoice_details
end
