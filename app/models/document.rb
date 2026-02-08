class Document < ApplicationRecord
  has_attached_file :paperclip

  validates_attachment_presence :paperclip
  validates_attachment_content_type :paperclip, content_type: /.*/

  def self.human_attribute_name(attr, options = {})
    { :document => "File" }[attr.to_sym] || super
  end
end
