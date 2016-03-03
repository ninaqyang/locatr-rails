FactoryGirl.define do
  factory :participation do
    association :user, factory: :user, strategy: :create
    association :event, factory: :event, strategy: :create
    invitation_accepted false
  end
end
