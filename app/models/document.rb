class Document < ActiveRecord::Base
  validates_presence_of :document
  validates_presence_of :name, :size, :content_type, :if => Proc.new { |document| document.document }

  before_validation :persist_document, :on => :create
  before_destroy :cleanup_document
  
  attr_accessor :document
  
  FILE_STORE = File.join(Rails.root, 'public', 'files')
  
  def image?
    self.content_type =~ /image/ ? true : false
  end
  
  private
  def persist_document
    return if !document
    
    FileUtils.mkdir_p(FILE_STORE) unless File.exists?(FILE_STORE)
    
    file = File.name_and_ext(File.basename(document.original_filename))
    
    self.name = file[:name]
    self.extension = file[:extension]
    self.content_type = document.content_type
    
    count = 1
    while (true)
      if Document.where(:name => self.name, :extension => self.extension).count(:id) != 0
        self.name = "#{file[:name]}-#{count}"
        count += 1
      else
        break
      end
    end
    
    File.open(File.join(FILE_STORE, "#{self.name}.#{self.extension}"), "wb") { |f| f.write(document.read) }
    
    self.size = File.size(File.join(FILE_STORE, "#{self.name}.#{self.extension}"))
    
    if !Mime::Type.lookup_by_extension(self.extension)
      Mime::Type.register self.content_type, self.extension
    end
  end
  
  def cleanup_document
    File.delete(File.join(FILE_STORE, "#{self.name}.#{self.extension}"))
  end
end
