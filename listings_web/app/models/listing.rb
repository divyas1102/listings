class Listing < ActiveRecord::Base
  belongs_to :address, dependent: :destroy
  belongs_to :landlord, dependent: :destroy
end
