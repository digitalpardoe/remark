class Role < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :users
  
  class << self
    def retrieve(role)
      where(:name => role.to_s).limit(1).first
    end
  end
end
