class Article < ActiveRecord::Base
  validates_presence_of :title, :body, :user, :permalink, :uuid
  validates_presence_of :published, :if => Proc.new { |article| !article.draft }
  validates_uniqueness_of :title, :permalink, :uuid
  
  attr_protected :uuid
  attr_readonly :uuid
  
  belongs_to :user
  
  scope :draft, where(:draft => true)
  scope :published, where(:draft => false)
  
  before_validation :generate_permalink, :set_published
  before_validation :generate_uuid, :on => :create
  
  private
  def generate_permalink
    if !self.permalink && self.title
      self.permalink = self.title.gsub(" ", "-").gsub(/[^a-zA-Z\-]/,"").squeeze("-").downcase
    end
  end
  
  def set_published
    unless self.draft
      self.published = Time.now
    end
  end
  
  def generate_uuid
    self.uuid = UUIDTools::UUID.timestamp_create.to_s
  end
end
