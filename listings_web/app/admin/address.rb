ActiveAdmin.register Address do
  permit_params :street, :city, :state, :zipcode, :latitude, :longitude
  actions :all

  config.filters = true
  filter :state
  filter :zipcode

  index do
    column :street, sortable: :street
    column :city, sortable: :city
    column :state, sortable: :state
    column :zipcode, sortable: :zipcode

    column :latitude, sortable: :latitude
    column :longitude, sortable: :longitude

  #   column 'Address' do |listing|
  #     link_to listing.address, admin_address_path(listing)
  #   end
    actions
  end
end
