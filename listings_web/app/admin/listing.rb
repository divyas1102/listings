ActiveAdmin.register Listing do
  permit_params :listing_identifier, :listing_source_url, :address
  actions :all, except: [:update, :destroy]

  config.filters = true
  filter :listing_identifier
  filter :listing_source_url

  index do
    column :listing_identifier, sortable: :listing_identifier
    column :listing_source_url, sortable: :listing_source_url

    column 'Address' do |listing|
      link_to listing.address, admin_listing_path(listing)
    end
    actions
  end
end
