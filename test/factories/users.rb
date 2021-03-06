FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@example.com" }
    name Faker::Name.name
    password 'password'
    password_confirmation 'password'
  end
end
