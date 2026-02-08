# SimpleCov code coverage
require 'simplecov'
SimpleCov.start 'rails' do
  add_filter "/spec/"
  add_group "Sweepers", "app/sweepers"
end

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

def quietly
  v = $VERBOSE
  $VERBOSE = nil
  yield
  ensure
    $VERBOSE = v
end

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
quietly { Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f} }

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.syntax = [:should, :expect]
  end

  config.expect_with :rspec do |expectations|
    expectations.syntax = [:should, :expect]
  end

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
end
