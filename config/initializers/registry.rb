IDENTIFIER = "com.github.digitalpardoe.remark"
TEXT_FILTERS = [
  {:name => 'html', :human_readable => 'HTML'},
  {:name => 'markdown', :human_readable => 'Markdown'},
  {:name => 'textile', :human_readable => 'Textile'}
]
DEFAULT_TEXT_FILTER = TEXT_FILTERS[1][:name]
