class File
  class << self
    def name_and_ext(file)
      file_ext = File.extname(file).gsub(".","")
      file_name = file.gsub(".#{file_ext}", "")
      
      { :name => file_name, :extension => file_ext }
    end
    
    # From the attachment_fu plugin: https://github.com/technoweenie/attachment_fu
    def sanitize_filename(filename)
      return unless filename
      filename.strip.tap do |name|
        name.gsub!(/^.*(\\|\/)/, '')
        name.gsub!(/[^A-Za-z0-9\.\-]/, '_')
      end
    end
  end
end
