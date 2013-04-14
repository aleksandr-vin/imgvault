class Comment < ActiveRecord::Base
  belongs_to :image
  attr_accessible :body, :commenter

  validates :commenter, :presence => true
  validates :body,      :presence => true,
                        :length => { :minimum => 2,
                                     :maximum => 140 }
end
