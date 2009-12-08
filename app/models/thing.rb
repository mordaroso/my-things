class Thing < ActiveRecord::Base
  validates_presence_of :name

  has_attached_file :image, :styles => { :medium => "500x500>", :small => "200x150>" }

  attr_accessible :name, :description, :image
end
