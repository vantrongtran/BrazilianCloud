class Client < ApplicationRecord
  has_many :invoices, dependent: :destroy
  has_many :invoice_details, through: :invoices
  has_many :products, through: :invoice_details

  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: Settings.validations.email_regex }
end
