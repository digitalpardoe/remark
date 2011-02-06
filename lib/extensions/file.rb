class File
  class << self
    def name_and_ext(file)
      file_ext = File.extname(file).gsub(".","")
      file_name = file.gsub(".#{file_ext}", "")
      
      { :name => file_name, :extension => file_ext }
    end
  end
end
