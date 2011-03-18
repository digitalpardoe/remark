class Page < ActiveRecord::Base
  include Permalink
  
  validates_presence_of :title, :body, :user, :permalink, :text_filter
  validates_presence_of :published, :if => Proc.new { |article| !article.draft }
  validates_uniqueness_of :title, :permalink
  validates_format_of :permalink, :with => /\A([a-z]+-{0,1})*([a-z]+)\Z/i
  
  belongs_to :user
  
  scope :draft, where(:draft => true)
  scope :published, where(:draft => false)
  scope :hidden, where(:hidden => true)
  scope :visible, where(:hidden => false)
  
  before_validation :generate_permalink
  before_validation :set_published, :if => Proc.new { |page| !page.draft && (!page.published || page.draft_changed?) }
  
  private
  def set_published
    self.published = Time.now
  end
end
