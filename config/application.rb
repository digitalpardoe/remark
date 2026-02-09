require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Remark
  class Application < Rails::Application
    config.load_defaults 7.2

    config.autoload_paths += %W(#{Rails.root}/lib #{Rails.root}/lib/extensions)

    config.time_zone = 'UTC'

    config.encoding = "utf-8"

    config.filter_parameters += [:password]

    config.assets.version = '1.0'

    config.action_view.field_error_proc = Proc.new { |html_tag, instance| "#{html_tag}".html_safe }

    # Opt out of 7.1+ defaults that would break existing behavior
    config.active_support.cache_format_version = 7.0
    config.add_autoload_paths_to_load_path = true
  end
end
