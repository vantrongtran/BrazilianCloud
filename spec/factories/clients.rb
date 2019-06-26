FactoryBot.define do
  factory :client do
    name { "MyString" }
    email { Faker::Internet.email }
    address { "MyString" }
    phone { "0987654321" }
  end
end
