class Comment < ActiveRecord::Base
  include Unique, Gravtastic
  
  validates_presence_of :name, :email, :unless => :assigned_user?
  validates_presence_of :user, :if => Proc.new { |comment| comment.name.blank? && comment.email.blank? }
  validates_presence_of :body, :article, :uuid
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :unless => :assigned_user?
  validates_format_of :website, :with => /^$|^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/i
  
  attr_protected :uuid
  attr_readonly :uuid
  
  belongs_to :article
  belongs_to :user
  
  before_validation :generate_uuid, :on => :create
  before_create :set_spam
  
  scope :spam, where(:spam => true)
  scope :ham, where(:spam => false)
  
  is_gravtastic!
  
  def toggle
    self.spam = !self.spam
  end
  
  private
  def assigned_user?
    self.user != nil
  end
  
  def set_spam
    if self.user != nil
      self.spam = false
    else
      self.spam = true
    end
    true
  end
end
