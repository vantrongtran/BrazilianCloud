class Product < ApplicationRecord
  acts_as_paranoid

  has_many :invoice_details
end
