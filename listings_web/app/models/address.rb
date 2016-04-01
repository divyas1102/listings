class Address < ActiveRecord::Base
  has_one :listing, dependent: :destroy
  validates_uniqueness_of :longitude, :scope => :latitude, :message => ' and latitude are not unique'
end
