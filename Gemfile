source 'http://rubygems.org'

# Rails version.
gem 'rails', '3.0.0.beta4'

# Application server.
gem 'mongrel', '1.1.5'

# Database engine.
begin
  case File.open(File.join(File.dirname(__FILE__), "config", "database.yml")).read.scan(/adapter:\ .*/).first.gsub("adapter: ", "").strip
    when "sqlite3"
      gem 'sqlite3-ruby', '1.3.1', :require => 'sqlite3'
    when "mysql"
      gem 'mysql', '2.8.1'
  end
rescue
  if File.basename( $0 ) == "bundle"
    puts <<-MSG

Please ensure you run 'rake remark:setup:db[adapter]' then
run 'bundle install' again to make sure you have correct
database driver installed.

    MSG
  end
end

# Required libraries.
gem 'bluecloth', '2.0.7'
gem 'RedCloth', '4.2.3'
gem 'cancan', '1.1.1'
gem 'uuidtools', '2.1.1'
gem 'rakismet', '0.4.2'
gem 'gravtastic', '2.2.0'

# Environment specific libraries.
group :test do
  gem 'rspec', '2.0.0.beta.17'
  gem 'rspec-rails', '2.0.0.beta.17'
  gem 'rcov', '0.9.8'
end
