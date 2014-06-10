class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.belongs_to :event, index: true
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.string :location_name

      t.timestamps
    end
  end
end
