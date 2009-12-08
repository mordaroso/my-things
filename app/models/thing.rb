class Thing < ActiveRecord::Base
  acts_as_taggable_on :tags

  validates_presence_of :name

  has_attached_file :image, :styles => { :medium => "500x500>", :small => "200x150>" }

  attr_accessible :name, :description, :image, :tag_list

  def self.per_page
    9
  end

end
