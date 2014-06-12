class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_uid
      t.string :image_name
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true

      t.timestamps
    end
  end
end
