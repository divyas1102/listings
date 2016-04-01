class CreateLandlords < ActiveRecord::Migration
  def up
    create_table :landlords do |t|
      t.string :name, null: false
      t.string :email
      t.string :phone

      t.timestamps
    end
    add_index :landlords, :name
  end

  def down
    drop_table :landlords
  end

end
