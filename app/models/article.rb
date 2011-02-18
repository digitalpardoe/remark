class Article < ActiveRecord::Base
  include Permalink, Unique
  
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
  
  before_validation :generate_permalink, :process_tags
  before_validation :set_published, :if => Proc.new { |article| !article.draft && (!article.published || article.draft_changed?) }
  before_validation :generate_uuid, :on => :create
    
  attr_accessor :tags_to_process
  
  def composite_tags=(args)
    self.tags_to_process = args
  end
  
  def composite_tags
    self.tags.map { |tag| tag = tag.name }.join(', ')
  end
  
  private
  def set_published
    self.published = Time.now
  end
  
  def process_tags
    self.tags = self.tags_to_process.gsub(/\ *,\ */, ",").split(",").delete_if { |tag| tag == '' }.collect do |tag|
      Tag.find_or_create_by_name(tag)
    end unless !self.tags_to_process
  end
end
