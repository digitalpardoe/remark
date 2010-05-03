class Comment < ActiveRecord::Base
  validates_presence_of :name, :email, :unless => :assigned_user?
  validates_presence_of :user, :if => Proc.new { |comment| !comment.name && !comment.email }
  validates_presence_of :body, :article, :uuid
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :unless => :assigned_user?
  validates_format_of :website, :with => /^$|^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/i
  
  attr_protected :uuid
  attr_readonly :uuid
  
  belongs_to :article
  belongs_to :user
  
  before_validation :generate_uuid, :on => :create
  
  scope :spam, where(:spam => true)
  scope :ham, where(:spam => false)
  
  private
  def assigned_user?
    self.user != nil
  end
  
  def generate_uuid
    self.uuid = UUIDTools::UUID.timestamp_create.to_s
  end
end
