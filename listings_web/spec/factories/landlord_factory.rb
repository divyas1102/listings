FactoryGirl.define do
  factory :landlord do
    sequence(:name) { |n| "#{n}" }
    phone '111-222-3333'
    email ''
  end
end
