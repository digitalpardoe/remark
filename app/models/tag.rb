class Tag < ActiveRecord::Base
  include ActiveModel::MassAssignmentSecurity
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  default_scope { order('name ASC') }
  
  has_and_belongs_to_many :articles
end
