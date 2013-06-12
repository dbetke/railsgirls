class Idea < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  attr_accessible :description, :name, :picture, :completed, :range
  validates :name, :presence => true, :uniqueness => true
  validates :description, :presence => true
  #validates :range, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }
end
