class Role < ActiveRecord::Base
  include ActiveModel::MassAssignmentSecurity
  
  validates_presence_of :name, :human_readable
  validates_uniqueness_of :name, :human_readable
  
  has_many :users
  
  class << self
    def retrieve(role)
      where(:name => role.to_s).limit(1).first
    end
  end
end
