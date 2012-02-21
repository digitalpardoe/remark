class Page < ActiveRecord::Base
  include Permalink, Schedule
  
  validates_presence_of :title, :body, :user, :permalink, :text_filter, :published_at
  validates_uniqueness_of :title, :permalink
  validates_format_of :permalink, :with => /\A([a-z]+-{0,1})*([a-z]+)\Z/i
  
  belongs_to :user
  
  default_scope order('sort_order DESC, title ASC')
  
  scope :draft, where(:draft => true)
  scope :published, where(:draft => false).where('published_at <= ?', Time.zone.now)
  scope :hidden, where(:hidden => true)
  scope :visible, where(:hidden => false)
  
  before_validation :generate_permalink

  after_save :schedule
  before_destroy :unschedule

  def up
    self.sort_order = self.sort_order + 1
  end
  
  def down
    self.sort_order = self.sort_order - 1
  end
  
  def self.human_attribute_name(attr, options = {})
    { :body => "Content" }[attr.to_sym] || super
  end
end
