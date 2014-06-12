class Image < ActiveRecord::Base
  dragonfly_accessor :image
  belongs_to :user
  belongs_to :event

end
