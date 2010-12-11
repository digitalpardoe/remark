class Setting < ActiveRecord::Base
  validates_presence_of :resource, :key, :human_readable
  validates_presence_of :value, :if => Proc.new { |setting| setting.required }
  validates_uniqueness_of :key, :scope => [:resource]
  validates_uniqueness_of :human_readable
  
  default_scope where(:hidden => false).order('human_readable ASC')
  
  scope :resource, lambda { |resource| where(:resource => resource) } do
    def value(key)
      result = where(:key => key.to_s).first
      result.value unless !result
    end
  end
  
  scope :application, resource(IDENTIFIER)
  scope :hidden, lambda { with_exclusive_scope do where(:hidden => true) end }
    
  attr_protected :hidden
end
