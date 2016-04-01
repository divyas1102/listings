class CreateListingDetails < ActiveRecord::Migration
  def up
    create_table :listing_details do |t|
      t.integer :price, null: false
      t.integer :bedroom_count
      t.integer :bathroom_count
      t.string :title
      t.text :description
      t.references :listing, foreign_key: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :listing_details
  end
end
