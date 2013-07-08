class Stylesheet
  class << self
    def available
      (Dir.entries(File.join(Rails.root, 'app', 'assets', 'stylesheets'))).select { |x| x =~ /^(?!session|admin).*scss$/ }.collect { |x| x.gsub(".css.scss","") }
    end
  end
end