class Landlord < ActiveRecord::Base

  has_many :listing, dependent: :destroy

  before_validation :format_phone_number

  #validates :phone, length: {is: 10}

  def format_phone_number
    self.phone = phone.split('').select{|n| n.match(/[0-9]+/)}.join('') if phone
  end
end
