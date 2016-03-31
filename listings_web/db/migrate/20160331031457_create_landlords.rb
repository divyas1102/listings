class CreateLandlords < ActiveRecord::Migration
  def up
    create_table :landlords do |t|
      t.string :email
      t.string :phone

      t.timestamps
    end
  end

  def down
    drop_table :landlords
  end

end
