class Article < ActiveRecord::Base
  validates_presence_of :title, :body, :user, :permalink, :uuid
  validates_presence_of :published, :if => Proc.new { |article| !article.draft }
  validates_uniqueness_of :title, :permalink, :uuid
  validates_format_of :permalink, :with => /\A([a-z]+-{0,1})*([a-z]+)\Z/i
  
  attr_protected :uuid, :tags
  attr_readonly :uuid
  
  belongs_to :user
  has_many :comment
  has_and_belongs_to_many :tags
  
  scope :draft, where(:draft => true)
  scope :published, where(:draft => false)
  
  before_validation :generate_permalink, :set_published, :process_tags
  before_validation :generate_uuid, :on => :create
  
  attr_accessor :composite_tags
  
  private
  def generate_permalink
    if !self.permalink && self.title
      self.permalink = self.title.gsub(" ", "-").gsub(/[^a-z\-]/i, "").squeeze("-").downcase
    end
  end
  
  def set_published
    unless self.draft
      self.published = Time.now
    end
  end
  
  def process_tags
    self.composite_tags.split(",").each do |tag|
      self.tags << Tag.find_or_create_by_name(tag)
    end unless !composite_tags
  end
  
  def generate_uuid
    self.uuid = UUIDTools::UUID.timestamp_create.to_s
  end
end
