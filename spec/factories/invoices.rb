FactoryBot.define do
  factory :invoice do
    association :user
    total { "9.99" }
    status { 1 }
  end
end
