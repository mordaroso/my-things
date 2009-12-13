class Loan < ActiveRecord::Base
  belongs_to :person
  belongs_to :thing

  named_scope :borrowed, :conditions => {:to => nil}
end
