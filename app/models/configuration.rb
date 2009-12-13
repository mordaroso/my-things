class Configuration < ActiveRecord::Base
  validates_presence_of :name, :value

  attr_accessible

  # getter method
  def self.get(name)
    config = self.find_by_name(name.to_s)
    return nil unless config
    config.value
  end

  # setter method
  def self.set(hash)
    hash.each do |name, value|
      config = self.find_or_create_by_name(name.to_s)
      config.value = value
      config.save!
    end
  end
end
