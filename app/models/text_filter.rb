class TextFilter < ActiveRecord::Base
  validates_presence_of :name, :human_readable
  
  has_many :pages
  has_many :articles
end
