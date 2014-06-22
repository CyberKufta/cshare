class Image < ActiveRecord::Base
  validates_presence_of :image
  validates_property :format, of: :image, in: ['png', 'jpeg', 'gif'], message: "only valid image files"
  dragonfly_accessor :image
  belongs_to :user
  belongs_to :event






end
