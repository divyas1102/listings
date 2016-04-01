class Photo < ActiveRecord::Base
  belongs_to :listing, dependent: :destroy
end
