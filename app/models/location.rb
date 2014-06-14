class Location < ActiveRecord::Base
  belongs_to :event
  validates :address, presence: {message: "Either Address or Latitude and longitude should be filled"} , if: "longitude.nil? || latitude.nil?"
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode
end
