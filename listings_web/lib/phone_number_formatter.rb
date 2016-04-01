module PhoneNumberFormatter

  def format_phone_number(phone)
    phone = phone.split('').select{|n| n.match(/[0-9]+/)}.join('') if phone
    phone
  end
end