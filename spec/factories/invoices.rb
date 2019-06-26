FactoryBot.define do
  factory :invoice do
    association :client
    total { "9.99" }
    status { 1 }
  end
end
