class Page < ActiveRecord::Base
  include Permalink
  
  validates_presence_of :title, :body, :user, :permalink, :text_filter
  validates_presence_of :published_at, :if => Proc.new { |article| !article.draft }
  validates_uniqueness_of :title, :permalink
  validates_format_of :permalink, :with => /\A([a-z]+-{0,1})*([a-z]+)\Z/i
  
  belongs_to :user
  
  scope :draft, where(:draft => true)
  scope :published, where(:draft => false)
  scope :hidden, where(:hidden => true)
  scope :visible, where(:hidden => false)
  
  before_validation :generate_permalink
  before_validation :set_published_at, :if => Proc.new { |page| !page.draft && (!page.published_at || page.draft_changed?) }
  
  HUMANIZED_ATTRIBUTES = {
      :body => "Content"
  }
  
  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  
  private
  def set_published_at
    if self.published_at && self.published_at > Time.now
      self.draft = true
    else
      self.published_at = Time.now
    end
  end
end
