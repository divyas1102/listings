class Address < ActiveRecord::Base
  attr_accessible :street, :city, :state, :zipcode
end
