source 'http://rubygems.org'

# Rails version
gem 'rails', '3.2.13'

# Required libraries
gem 'bluecloth', '2.2.0'
gem 'RedCloth', '4.2.9'
gem 'cancan', '1.6.9'
gem 'uuidtools', '2.1.3'
gem 'gravtastic', '3.2.6'
gem 'will_paginate', '3.0.4'

# File uploading
gem 'paperclip', '3.0.4'
gem 'rmagick', '2.13.2'

# Other libraries
gem 'jquery-rails', '2.2.1'
gem 'jquery-ui-rails', '4.0.2'
gem 'less-rails-bootstrap', '2.3.2'

group :assets do
  gem 'less-rails', '2.3.1'
  gem 'therubyracer', '0.10.2'
  gem 'coffee-rails', '3.2.2'  
  gem 'uglifier', '1.2.7'
end

# Environment specific libraries
group :production do
  gem 'pg', '0.13.2'
end

group :development, :test do
  gem 'sqlite3', '1.3.7'
end

group :development do
  # Application server
  gem 'mongrel', '1.2.0.pre2'
end

group :test do
  gem 'rspec-rails', '2.9.0'
  gem 'factory_girl_rails', '3.1.0'
  gem 'autotest', '4.4.6'
  gem 'ZenTest', '4.9.0'
  gem 'simplecov', '0.6.4'
  gem 'multi_json', '1.3.7'
end
