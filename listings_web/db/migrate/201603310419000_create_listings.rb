class CreateListings < ActiveRecord::Migration
  def up
    create_table :listings do |t|
      t.string :listing_identifier, null: false
      t.string :listing_source_url, null: false
      t.references :address, foreign_key: true
      t.references :landlord, foreign_key: true
      
      t.timestamps
    end

    add_index :listings, :listing_identifier
  end

  def down
    drop_table :listings
  end
end
