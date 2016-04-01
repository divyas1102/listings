FactoryGirl.define do
  factory :listing do
    sequence(:listing_identifier) { |n| "LI #{n}" }
    listing_source_url 'http://www.test.com'

    after(:build) do |listing|
      listing.address = build(:address)
      listing.landlord = build(:landlord)
      listing.photo = [build(:photo), build(:photo), build(:photo)]
    end
  end
end
