class Document < ActiveRecord::Base
  include ActiveModel::MassAssignmentSecurity
  
  has_attached_file :paperclip
  
  validates_attachment_presence :paperclip
  
  def self.human_attribute_name(attr, options = {})
    { :document => "File" }[attr.to_sym] || super
  end
end
