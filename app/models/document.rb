class Document < ActiveRecord::Base
  if S3_ENABLED
    has_attached_file :paperclip,
      :storage => :s3,
      :s3_credentials => { :access_key_id => S3_ACCESS_KEY_ID, :secret_access_key => S3_SECRET_ACCESS_KEY },
      :bucket => S3_BUCKET,
      :path => "remark/:attachment/:id/:style/:filename"
  else
    has_attached_file :paperclip
  end
  
  def self.human_attribute_name(attr, options = {})
    { :document => "File" }[attr.to_sym] || super
  end
end
