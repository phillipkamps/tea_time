FactoryBot.define do
  factory :subscription do
    title { "MyString" }
    price { "MyString" }
    status { "MyString" }
    frequency { "MyString" }
    user { nil }
    tea { nil }
  end
end
