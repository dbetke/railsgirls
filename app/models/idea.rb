class Idea < ActiveRecord::Base
  attr_accessible :content, :name, :tag_list
  acts_as_taggable

  has_many :tasks
  mount_uploader :picture, PictureUploader
  attr_accessible :description, :name, :picture, :completed, :range
  validates :name, :presence => true, :uniqueness => true
  validates :description, :presence => true
  #validates :range, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }

  scope :crazy_query, where("range=8").order("created_at ASC").limit(5)
  scope :timely, -> { where(["created_at <= ?", Time.now]) } 
  scope :ranged, lambda {|range| where(:range => range) if range }
end
