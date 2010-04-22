class Setting < ActiveRecord::Base
  validates_presence_of :resource, :key, :value, :human_readable
  validates_uniqueness_of :key, :scope => [:resource]
  
  default_scope where(:hidden => false)
  
  scope :resource, lambda { |resource| where(:resource => resource) } do
    def setting(key)
      where(:key => key).first
    end
  end
  
  scope :application, resource(IDENTIFIER)
  scope :hidden, lambda { with_exclusive_scope do where(:hidden => true) end }
    
  attr_protected :hidden
end
