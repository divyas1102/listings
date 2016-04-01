class CreatePhotos < ActiveRecord::Migration
  def up
    create_table :photos do |t|
      t.string :url
      t.string :caption
      t.text :description
      t.integer :seq
      t.references :listing, foreign_key: true

      t.timestamps null: false
    end
  end

  def down
    drop table :photos
  end
end
