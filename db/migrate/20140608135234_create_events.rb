class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :location_name
      t.belongs_to :created_by, index: true

      t.timestamps
    end
  end
end
