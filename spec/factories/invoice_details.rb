FactoryBot.define do
  factory :invoice_detail do
    association :invoice
    association :product
    quantity { 1 }
    price { "9.99" }
  end
end
