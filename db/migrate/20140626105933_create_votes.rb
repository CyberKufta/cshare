class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :value
      t.integer :votable_id
      t.string :votable_type
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
