class Event < ActiveRecord::Base
  belongs_to :user, foreign_key: "created_by_id"
  has_many :schedules
  has_many :attendances, foreign_key: "event_id", dependent: :destroy
  has_many :attenders, through: :attendances, source: :user
  has_many :images
  has_one :location, dependent: :destroy
  accepts_nested_attributes_for :location

end
