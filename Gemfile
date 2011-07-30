source 'http://rubygems.org'

# Rails version
gem 'rails', '3.0.9'

# Required libraries
gem 'bluecloth', '2.0.9'
gem 'RedCloth', '4.2.7'
gem 'cancan', '1.5.1'
gem 'uuidtools', '2.1.1'
gem 'gravtastic', '3.1.0'
gem 'will_paginate', '3.0.pre2'

# File uploading
gem 'paperclip', '2.3.15'
gem 'rmagick', '2.13.1'
# gem 'aws-s3', '0.6.2'  #heroku

# Other libraries
gem 'jquery-rails', '1.0.2'
gem 'lessr', '1.0.0'

# Environment specific libraries
group :production do
  gem 'mysql2', '0.3.6'   #no-heroku
#  gem 'pg', '0.11.0'     #heroku
#  gem 'thin', '1.2.11'   #heroku
end

group :development, :test do
  gem 'sqlite3', '1.3.3'
end

group :development do
  # Application server
  gem 'mongrel', '1.2.0.pre2'
end

group :test do
  gem 'rspec-rails', '2.5.0'
  gem 'factory_girl_rails', '1.1.rc1'
  gem 'rcov', '0.9.9'
  gem 'autotest', '4.4.6'
end
