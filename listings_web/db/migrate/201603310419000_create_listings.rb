class CreateListings < ActiveRecord::Migration
  def up
    create_table :listings do |t|
      t.string :listing_id, null: false
      t.string :listing_source_url, null: false
      
      t.timestamps

      add_foreign_key :listings, :landlords, name: 'landlord_id'
      add_foreign_key :listings, :addresses, name: 'address_id'
    end

    add_index :listings, :listing_id
  end

  def down
    drop_table :listings
  end
end
