class Landlord < ActiveRecord::Base
  include PhoneNumberFormatter

  has_many :listing, dependent: :destroy

  validates :phone, length: {is: 10}
  before_validation :format_phone

  private
  def format_phone
    self.phone = self.format_phone_number(phone)
  end
end
