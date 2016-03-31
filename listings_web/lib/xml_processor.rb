class XmlProcessor

  def self.process(file_name = 'resources/code_challenge_listings.xml')#'resources/code_challenge_listings.xml')
    parsed_xml = Nokogiri::XML(File.open(file_name)) do |config|
      config.noblanks
    end

    parsed_xml.xpath("//property").each do |property|
      current_address = nil
      current_landlord = nil

      property.xpath('location').each do |address_element|
        street = address_element.xpath('street-address').text
        city = address_element.xpath('city-name').text
        state = address_element.xpath('state-code').text
        zipcode = address_element.xpath('zipcode').text
        current_address = Address.new(street: street, city: city, state: state, zipcode: zipcode)
        current_address.save!
      end

      property.xpath('agent').each do |landlord_element|
        phone = landlord_element.xpath('agent-phone').text
        email = landlord_element.xpath('agent-email').text
        current_landlord = Landlord.new(phone: phone, email: email)
        current_landlord.save!
      end

      listing_id = property.xpath('provider-listingid').text
      listing_source_url = property.xpath('lp-url').text

      Listing.new(listing_id: listing_id, listing_source_url: listing_source_url, address_id: current_address.id, landlord_id: current_landlord.id).save!
    end
  end

  puts self.process
end