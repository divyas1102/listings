class XmlProcessor

  def self.process(file_name = 'resources/code_challenge_listings.xml')#'resources/code_challenge_listings.xml')
    parsed_xml = Nokogiri::XML(File.open(file_name)) do |config|
      config.noblanks
    end

    parsed_xml.xpath("//property").each do |property|
      current_address = nil
      current_landlord = nil        

      property.xpath('location').each do |address_element|
        address = {
          street: address_element.xpath('street-address').text,
          city: address_element.xpath('city-name').text,
          state: address_element.xpath('state-code').text,
          zipcode: address_element.xpath('zipcode').text
        }

        longitude = address_element.xpath('longitude').text
        latitude = address_element.xpath('latitude').text

        begin
          current_address = Address.where(longitude: longitude, latitude: latitude).first_or_create!
          current_address.update_attributes!(address)
        rescue => e
          # log e
          puts "Create Address Error: " + e.message
          next
        end
      end

      property.xpath('agent').each do |landlord_element|
        name = landlord_element.xpath('agent-name').text

        landlord = {            
          phone: landlord_element.xpath('agent-phone').text,
          email: landlord_element.xpath('agent-email').text
        }

        begin
          current_landlord = Landlord.where(name: name).first_or_initialize
          current_landlord.update_attributes!(landlord)
        rescue => e
          #log e
          puts "Create Landord Error: " + e.message
          next
        end
      end

      listing_identifier = property.xpath('details/provider-listingid').text
      listing_source_url = property.xpath('landing-page/lp-url').text

      listing_details = {
        price: property.xpath('details/price').text,
        bathroom_count: property.xpath('details/num-bathrooms').text,
        bedroom_count: property.xpath('details/num-bedrooms').text,
        title: property.xpath('details/listing-title').text,
        description: property.xpath('details/description').text
      }

      begin
        current_listing = Listing.where(listing_identifier: listing_identifier, listing_source_url: listing_source_url).first_or_initialize

        property.xpath('pictures').each do |photo_element|
          url = photo_element.xpath('picture-url').text
          photo = {           
            caption: photo_element.xpath('picture-caption').text,
            description: photo_element.xpath('picture-description').text,
            seq: photo_element.xpath('picture-seq-number').text
          }
          all_photos = []
          current_photo = Photo.where(url: url).first_or_initialize
          current_photo.update_attributes!(photo)
          all_photos << current_photo
          current_listing.update_attributes!(address: current_address, landlord: current_landlord)
          current_listing.save!

          begin
            current_listing_detail = ListingDetail.where(listing: current_listing).first_or_initialize
            current_listing_detail.update_attributes!(listing_details)
          rescue => e
            # log e
            puts "Create Listing Detail Error: " + e.message
            next
          end
      
          # if all_photos.length > 3
          #   current_listing.update_attributes!(address: current_address, landlord: current_landlord)
          #   all_photos.each do |p|
          #     ListingPhoto.new(listing: current_listing, photo: p)
          #   end
          # end
        end
      rescue => e
        # log e
        puts "Create Listing Error: " + e.message
        next
      end
    end
  end
end