class Loan < ActiveRecord::Base
  belongs_to :person
  belongs_to :thing

  named_scope :borrowed, :conditions => {:to => nil}

  validate :validates_dates
  validates_presence_of :from, :person

  attr_accessible :from, :to, :person_id

  private
    def validates_dates
      errors.add(:to, 'has to be after from.') if to.present? && (from > to)
      errors.add(:from, 'can\'t be in the future.') if from.present? && (from > Date.today)
      errors.add(:to, 'can\'t be in the future.') if to.present? && (to > Date.today)
    end
end
