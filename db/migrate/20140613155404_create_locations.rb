class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :longitude
      t.float :latitude
      t.string :address
      t.belongs_to :event, index: true
      t.float :radius

      t.timestamps
    end


    add_index :locations, [:latitude, :longitude]
  end
end
