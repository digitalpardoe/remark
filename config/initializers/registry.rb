IDENTIFIER = "com.github.digitalpardoe.remark"
TEXT_FILTERS = [
  {:name => 'html', :human_readable => 'HTML', :method => lambda { |text| text }},
  {:name => 'markdown', :human_readable => 'Markdown', :method => lambda { |text| BlueCloth.new(text).to_html }},
  {:name => 'textile', :human_readable => 'Textile', :method => lambda { |text| RedCloth.new(text).to_html }}
]
DEFAULT_TEXT_FILTER = TEXT_FILTERS[1][:name]
DEFAULT_TIME_ZONE = "UTC"
DEFAULT_STYLESHEET = "simple"
