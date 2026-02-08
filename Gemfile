source 'https://rubygems.org'

# Rails version
gem 'rails', '6.1.7.8'

# Required libraries
gem 'kramdown', '~> 2.4'
gem 'RedCloth', '4.2.9'
gem 'cancancan', '~> 3.5'
gem 'uuidtools', '2.1.4'
gem 'gravtastic', '3.2.6'
gem 'will_paginate', '~> 4.0'

# File uploading
gem 'kt-paperclip', '~> 7.2'
gem 'rmagick', '~> 5.3'

# Other libraries
gem 'jquery-rails', '~> 4.3'
gem 'jquery-ui-rails', '~> 6.0'
gem 'bootstrap-sass', '~> 3.4'

# Asset libraries
gem 'sass-rails', '~> 6.0'
gem 'sprockets-rails', '~> 3.4'
gem 'coffee-rails', '~> 4.2'
gem 'uglifier', '~> 4.2'

# Boot speed
gem 'bootsnap', require: false
gem 'logger', '~> 1.5.0'
gem 'listen'

# Environment specific libraries
group :production do
  # gem 'therubyracer', '0.11.4'
  # gem 'pg', '0.17.1'
end

group :development do
  gem 'puma', '~> 5.6'
  gem 'bullet', '~> 7.0'
  gem 'better_errors', '~> 2.10'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'sqlite3', '~> 1.4'
end

group :test do
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 5.1'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'simplecov', '~> 0.22'
end
