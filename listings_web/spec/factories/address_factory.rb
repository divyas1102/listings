FactoryGirl.define do
  factory :address do
    sequence(:latitude) { |n| "#{n}" }
    longitude '2.0'
    city 'San Francisco'
    zipcode '94105'
    street '123 Mission'
    state 'CA'
  end
end
