FactoryGirl.define do
  factory :photo do
    sequence(:url) { |n| "#{n}" }
    caption 'test_caption'
    seq 'test_seq'
    description 'test_desc'
  end
end
