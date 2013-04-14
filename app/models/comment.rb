class Comment < ActiveRecord::Base
  belongs_to :image
  attr_accessible :body, :commenter
end
