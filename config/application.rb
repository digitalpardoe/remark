require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Remark
  class Application < Rails::Application
    config.load_defaults 6.1

    # Custom directories with classes and modules you want to be autoloadable.
    config.autoload_paths += %W(#{Rails.root}/lib #{Rails.root}/lib/extensions)

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    config.time_zone = 'UTC'

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    # Change the way error fields are processed.
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| "#{html_tag}".html_safe }
  end
end
