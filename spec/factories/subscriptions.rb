FactoryBot.define do
  factory :subscription do
    price { Faker::Number.decimal(l_digits: 1, r_digits: 2).to_s }
    frequency { %w[Daily Weekly Monthly Yearly].sample }
    status { Faker::Subscription.status }
  end
end
