FactoryGirl.define do
  factory :admin_user do
    sequence(:email) { |n| "person#{n}@swansway.com" }
    password "password"
    password_confirmation "password"
  end


  factory :bill do
    meal
    resident
    amount_decimal { Faker::Number.number(3) }
  end


  factory :meal do
    sequence(:date) { |n| n.days.ago }
  end


  factory :meal_resident do
    meal
    resident
  end


  factory :unit do
    sequence(:name) { |n| "Unit #{n}" }
  end


  factory :resident do
    name { Faker::Name.name }
    multiplier { Faker::Number.digit }
    unit
  end


  factory :guest do
    name { Faker::Name.name }
    multiplier { Faker::Number.digit }
    meal
    resident
  end
end
