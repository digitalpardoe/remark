class Article < ActiveRecord::Base
  include Permalink, Unique, TimeZoned
  
  validates_presence_of :title, :user, :permalink, :uuid, :text_filter, :published_at
  validates_presence_of :body, :if => Proc.new { |article| !article.link_article }
  validates_presence_of :url, :if => Proc.new { |article| article.link_article }
  validates_presence_of :excerpt, :if => Proc.new { |article| article.body.blank? && !article.url.blank? }
  
  validates_uniqueness_of :title, :permalink, :uuid
  validates_format_of :permalink, :with => /\A([a-z0-9]+-{0,1})*([a-z0-9]+)\Z/
  
  attr_protected :uuid, :tags
  attr_readonly :uuid
  
  belongs_to :user
  has_and_belongs_to_many :tags
  
  default_scope order('published_at DESC')
  
  scope :draft, where(:draft => true)
  scope :published, where(:draft => false).where('published_at <= ?', Time.now.utc)
  scope :unpublished, where(:draft => false).where('published_at > ?', Time.now.utc)
  
  before_validation :generate_permalink, :process_tags, :unzone
  before_validation :generate_uuid, :on => :create
  
  def self.human_attribute_name(attr, options = {})
    { :body => "Content", :url => "Link URL" }[attr.to_sym] || super
  end
  
  attr_accessor :tags_to_process, :link_post
  
  def composite_tags=(args)
    self.tags_to_process = args
  end

  def composite_tags
    self.tags.map { |tag| tag = tag.name }.join(', ')
  end

  private
  def process_tags
    self.tags = self.tags_to_process.gsub(/\ *,\ */, ",").split(",").delete_if { |tag| tag == '' }.collect do |tag|
      Tag.find_or_create_by_name(tag)
    end unless !self.tags_to_process
  end
end
