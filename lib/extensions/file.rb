class File
  class << self
    def name_and_ext(file)
      file_ext = File.extname(file).gsub(".","")
      file_name = file.gsub(".#{file_ext}", "")
      
      { :name => file_name, :extension => file_ext }
    end
    
    def sanitize_filename(filename)
      filename.strip.tap do |name|
        name.sub!(/\A.*(\\|\/)/, '')
        name.gsub!(/[^\w\.\-]/, '_')
      end
    end
  end
end
