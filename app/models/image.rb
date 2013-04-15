class Image < ActiveRecord::Base
  attr_accessible :author, :title, :pic

  validates :author, :presence => true
  validates :title,  :presence => true,
                     :length => { :minimum => 5,
                                  :maximum => 140 }

  has_many :comments, :dependent => :destroy

  has_attached_file :pic, :styles => { :large => "400x400>",
                                       :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"

  validates :pic, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :pic
end
