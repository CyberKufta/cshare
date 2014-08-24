class Comment < ActiveRecord::Base
	has_ancestry
	belongs_to :user
	belongs_to :commentable, polymorphic: true

end
