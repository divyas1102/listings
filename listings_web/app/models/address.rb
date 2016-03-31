class Address < ActiveRecord::Base

  has_one :listing, dependent: :destroy
end
