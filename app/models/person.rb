class Person < ActiveRecord::Base
  EMAIL_NAME_REGEX  = '[\w\.%\+\-]+'.freeze
  DOMAIN_HEAD_REGEX = '(?:[A-Z0-9\-]+\.)+'.freeze
  DOMAIN_TLD_REGEX  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'.freeze
  EMAIL_REGEX       = /\A#{EMAIL_NAME_REGEX}@#{DOMAIN_HEAD_REGEX}#{DOMAIN_TLD_REGEX}\z/i

  has_many :loans
  has_many :things, :through => :loans
  has_many :borrowed_things, :through => :loans, :source => :thing, :conditions => {:loans => {:to => nil}}

  validates_format_of :email, :with => EMAIL_REGEX, :allow_blank => true
  validates_presence_of :name
  validates_uniqueness_of :email, :name

  attr_accessible :name, :email, :phone, :address, :city, :zip_code
end
