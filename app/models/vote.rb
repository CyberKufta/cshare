class Vote < ActiveRecord::Base
  belongs_to :User
  belongs_to :votable, polymorphic: true
  
end
