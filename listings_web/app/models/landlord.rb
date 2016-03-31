class Landlord < ActiveRecord::Base

  has_one :listing, dependent: :destroy

  before_save :format_phone_number

  def format_phone_number
    phone.gsub('-', '').gsub('(', '').gsub(')', '')
  end
end
