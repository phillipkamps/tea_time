FactoryBot.define do
  factory :tea do
    name { Faker::Tea.variety }
    description { Faker::Coffee.notes }
    brew_temp_f { Faker::Number.within(range: 140..212) }
    brew_time_mins { Faker::Number.within(range: 1..5) }
  end
end
