module ApplicationHelper
  def tracking
    Setting.application.value(:tracking) unless Rails.env != 'production'
  end
  
  def name
    Setting.application.value(:name)
  end
  
  module ActionView::Helpers::AssetTagHelper
    def less_link_tag(*sources)
      options = sources.extract_options!.stringify_keys
      recursive = options.delete("recursive")
      
      sources = expand_less_sources(sources, recursive).collect { |source| compute_public_path(source, 'stylesheets', 'less', false) }
      sources.collect { |source| less_tag(source, options) }.join("\n").html_safe
    end
    
    def expand_less_sources(sources, recursive)
      if sources.first == :all
        collect_asset_files(config.stylesheets_dir, ('**' if recursive), '*.less')
      else
        sources.collect do |source|
          determine_source(source, @@stylesheet_expansions)
        end.flatten
      end
    end
    
    def less_tag(source, options)
      tag("link", { "rel" => "stylesheet/less", "type" => Mime::CSS, "media" => "screen", "href" => html_escape(path_to_stylesheet(source)) }.merge(options), false, false)
    end
  end
end
