FactoryGirl.define do
  factory :unit do
    sequence(:name) { |n| "Unit #{n}" }
  end


  factory :meal do
    date { rand(-200..200).days.ago }
  end


  factory :resident do
    name { Faker::Name.name }
    multiplier { Faker::Number.digit }
    balance { Faker::Number.number(6) }
    unit
  end


  factory :bill do
    meal
    resident
    amount { Faker::Number.number(4) }
  end


  factory :attendance do
    meal
    resident
    multiplier { Faker::Number.digit }
  end
end
