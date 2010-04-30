class Page < ActiveRecord::Base
  validates_presence_of :title, :body, :user, :permalink
  validates_presence_of :published, :if => Proc.new { |article| !article.draft }
  validates_uniqueness_of :title, :permalink
  
  belongs_to :user
  belongs_to :page
  has_many :pages
  
  scope :draft, where(:draft => true)
  scope :published, where(:draft => false)
  
  before_validation :generate_permalink, :set_published

  private
  def generate_permalink
    if !self.permalink && self.title
      self.permalink = self.title.gsub(" ", "-").gsub(/[^a-zA-Z\-]/, "").squeeze("-").downcase
    end
  end
  
  def set_published
    unless self.draft
      self.published = Time.now
    end
  end
end
