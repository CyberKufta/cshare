class Event < ActiveRecord::Base
  belongs_to :user, foreign_key: "created_by_id"
  has_many :schedules
end
