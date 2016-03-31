class Listing < ActiveRecord::Base
  attr_accessible :listing_id, :listing_source_url, :address_id, :landlord_id, :address, :landlord

  has_one :address
  has_one :landlord
end
