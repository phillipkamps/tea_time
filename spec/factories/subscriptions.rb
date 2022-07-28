FactoryBot.define do
  factory :subscription do
    price { Faker::Number.decimal(l_digits: 1, r_digits: 2).to_s }
    frequency { Faker::Subscription.subscription_term.to_s }
  end
end
