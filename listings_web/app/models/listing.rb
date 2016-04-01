class Listing < ActiveRecord::Base
  belongs_to :address, dependent: :destroy
  belongs_to :landlord, dependent: :destroy
  
  has_many :photo
  has_one :listing_detail

  #validates :photo, :length => { :minimum => 3}
end
