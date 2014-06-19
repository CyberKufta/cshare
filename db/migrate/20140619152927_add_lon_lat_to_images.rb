class AddLonLatToImages < ActiveRecord::Migration
  def change
    add_column :images, :lon, :float, default: 0.00
    add_column :images, :lat, :float, default: 0.00
  end
end
