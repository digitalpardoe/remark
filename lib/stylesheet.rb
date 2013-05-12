class Stylesheet
  class << self
    def available
      (Dir.entries(File.join(Rails.root, 'app', 'assets', 'stylesheets'))).select { |x| x =~ /^(?!session|admin).*less$/ }.collect { |x| x.gsub(".css.less","") }
    end
  end
end