class CreateAddresses < ActiveRecord::Migration
  def up
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :zipcode, null: false

      t.timestamps
    end
  end

  def down
    drop_table :addresses
  end

end
