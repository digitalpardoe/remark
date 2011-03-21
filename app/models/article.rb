class Article < ActiveRecord::Base
  include Permalink, Unique
  
  validates_presence_of :title, :body, :user, :permalink, :uuid, :text_filter
  validates_presence_of :published_at, :if => Proc.new { |article| !article.draft }
  validates_uniqueness_of :title, :permalink, :uuid
  validates_format_of :permalink, :with => /\A([a-z]+-{0,1})*([a-z]+)\Z/i
  
  attr_protected :uuid, :tags
  attr_readonly :uuid
  
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :tags
  
  scope :draft, where(:draft => true)
  scope :published, where(:draft => false)
  
  before_validation :generate_permalink, :process_tags
  before_validation :set_published_at, :if => Proc.new { |article| !article.draft && (!article.published_at || article.draft_changed?) }
  before_validation :generate_uuid, :on => :create
  
  def self.human_attribute_name(attr, options = {})
    { :body => "Content" }[attr.to_sym] || super
  end
  
  attr_accessor :tags_to_process
  
  def composite_tags=(args)
    self.tags_to_process = args
  end
  
  def composite_tags
    self.tags.map { |tag| tag = tag.name }.join(', ')
  end
  
  private
  def set_published_at
    if self.published_at && self.published_at > Time.now
      self.draft = true
    else
      self.published_at = Time.now
    end
  end
  
  def process_tags
    self.tags = self.tags_to_process.gsub(/\ *,\ */, ",").split(",").delete_if { |tag| tag == '' }.collect do |tag|
      Tag.find_or_create_by_name(tag)
    end unless !self.tags_to_process
  end
end
