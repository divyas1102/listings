class CreateAddresses < ActiveRecord::Migration
  def up
    create_table :addresses do |t|
      t.float :latitude, null: false
      t.float :longitude, null: false

      t.string :street
      t.string :city
      t.string :state
      t.integer :zipcode

      t.timestamps
    end
  end

  def down
    drop_table :addresses
  end

end
