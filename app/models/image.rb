class Image < ActiveRecord::Base
  validates_presence_of :image
  validates_property :format, of: :image, in: ['png', 'jpeg', 'gif'], message: "only valid image files"
  dragonfly_accessor :image
  belongs_to :user
  belongs_to :event
  has_many :votes, as: :votable
  acts_as_ordered_taggable
  after_validation :set_tags





  private
  	def set_tags
  	end











end
