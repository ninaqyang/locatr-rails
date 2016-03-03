FactoryGirl.define do
  factory :event do
    association :user, factory: :user, strategy: :create
    title Faker::Lorem.word
    address1 Faker::Address.street_name
    address2 Faker::Address.secondary_address
    city Faker::Address.city
    state Faker::Address.state
    zip Faker::Address.zip
    latitude    Faker::Address.latitude.to_f
    longitude    Faker::Address.longitude.to_f
    starts_on DateTime.now
    ends_on DateTime.now + 3.hours
  end
end
