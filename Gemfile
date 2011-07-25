source 'http://rubygems.org'

# Rails version
gem 'rails', '3.0.9'

# Application server
gem 'mongrel', '1.2.0.pre2'

# Database engine
dbconfig = File.join(File.dirname(__FILE__), "config", "database.yml")
unless File.exists?(dbconfig)
  if File.basename( $0 ) == 'bundle'
    puts <<-MSG

Please ensure you run 'rake remark:setup:db[adapter]' then
run 'bundle install' again to make sure you have correct
database driver installed.

    MSG
    exit
  end
else
  conf = YAML.load(File.read(dbconfig))
  case conf[ENV["RAILS_ENV"] || 'development']['adapter']
    when "sqlite3"
      gem 'sqlite3', '1.3.3'
    when "mysql"
      gem 'mysql', '2.8.1'
  end
end

# Required libraries
gem 'bluecloth', '2.0.9'
gem 'RedCloth', '4.2.7'
gem 'cancan', '1.5.1'
gem 'uuidtools', '2.1.1'
gem 'gravtastic', '3.1.0'
gem 'will_paginate', '3.0.pre2'

# Other libraries
gem 'jquery-rails', '1.0.2'
gem 'lessr', '1.0.0'

# Environment specific libraries
group :test, :development do
  gem 'rspec-rails', '2.5.0'
  gem 'factory_girl_rails', '1.1.rc1'
  gem 'rcov', '0.9.9'
  gem 'autotest', '4.4.6'
end
