class Article < ActiveRecord::Base
  validates_presence_of :title, :body, :user, :permalink, :uuid
  validates_presence_of :published, :if => Proc.new { |article| !article.draft }
  validates_uniqueness_of :title, :permalink, :uuid
  
  belongs_to :user
  
  scope :draft, where(:draft => true)
  scope :published, where(:draft => false)
  
  before_validation :generate_permalink, :set_published, :generate_uuid
  
  private
  def generate_permalink
    if !self.permalink
      self.permalink = self.title.gsub(" ", "-").gsub(/[^a-zA-Z\-]/,"")
      while self.permalink.include?("--") do
        self.permalink = self.permalink.gsub("--", "-")
      end
      self.permalink = self.permalink.downcase
    end
  end
  
  def set_published
    unless self.draft
      self.published = Time.now
    end
  end
  
  def generate_uuid
    self.uuid = UUIDTools::UUID.sha1_create(UUIDTools::UUID_DNS_NAMESPACE, Setting.application.setting('url').value)
  end
end
