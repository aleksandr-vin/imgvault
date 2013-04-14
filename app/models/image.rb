class Image < ActiveRecord::Base
  attr_accessible :author, :title

  validates :author, :presence => true
  validates :title,  :presence => true,
                     :length => { :minimum => 5,
                                  :maximum => 140 }
end
