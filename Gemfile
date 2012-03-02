source 'http://rubygems.org'

# Rails version
gem 'rails', '3.2.2'

# Required libraries
gem 'bluecloth', '2.2.0'
gem 'RedCloth', '4.2.9'
gem 'cancan', '1.6.7'
gem 'uuidtools', '2.1.2'
gem 'gravtastic', '3.2.6'
gem 'will_paginate', '3.0.3'
gem 'rufus-scheduler', '2.0.16'

# File uploading
gem 'paperclip', '2.7.0'
gem 'rmagick', '2.13.1'
# gem 'aws-sdk', '1.3.4'  #heroku

# Other libraries
gem 'jquery-rails', '2.0.1'
gem 'less-rails-bootstrap', '2.0.6'

group :assets do
  gem 'less-rails', '2.1.6'
  gem 'coffee-rails', '3.2.2'  
  gem 'uglifier', '1.2.3'
end

# Environment specific libraries
group :production do
  gem 'mysql2', '0.3.11'   #no-heroku
#  gem 'pg', '0.12.2'     #heroku
#  gem 'thin', '1.3.1'   #heroku
end

group :development, :test do
  gem 'sqlite3', '1.3.5'
end

group :development do
  # Application server
  gem 'mongrel', '1.2.0.pre2'
end

group :test do
  gem 'rspec-rails', '2.8.1'
  gem 'factory_girl_rails', '1.7.0'
  gem 'autotest', '4.4.6'
  gem 'simplecov', '0.6.1'
end
