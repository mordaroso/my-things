class Thing < ActiveRecord::Base
  has_many :loans
  has_many :persons, :through => :loans

  accepts_nested_attributes_for :loans, :allow_destroy => true

  acts_as_taggable_on :tags

  validates_presence_of :name
  validate :validates_open_loans

  has_attached_file :image, :styles => { :medium => "500x500>", :small => "200x150>" }

  attr_accessible :name, :description, :image, :tag_list, :loans_attributes

  def self.per_page
    9
  end

  private
    def validates_open_loans
      errors.add(:loans, 'are invalid. Item can only be borrowed once at a time.') if loans.map(&:to).compact.size > 1
    end

end
