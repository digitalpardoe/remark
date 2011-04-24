module ApplicationHelper
  def tracking
    Setting.application.value(:tracking).html_safe unless Rails.env != 'production'
  end
  
  def name
    Setting.application.value(:name)
  end
  
  def subtitle
    Setting.application.value(:subtitle)
  end
  
  def title(title)
		content_for(:title) { title }
	end
  
  def navigation
    pages = Page.published.visible.select(:title).select(:permalink).all
    content_tag :ul do
      "".tap do |list|
        pages.each do |page|
          list << content_tag(:li, link_to(page.title, page_path(:permalink => page.permalink)))
        end
      end.html_safe
    end
  end
  
  def article_path(article)
    super :day => article.published_at.strftime("%d"), :month => article.published_at.strftime("%m"), :year => article.published_at.strftime("%Y"), :permalink => article.permalink
  end
  
  def article_url(article)
    Setting.application.value(:url) + article_path(article)[1..-1]
  end
  
  def text_filter(entity, text_method)
    (TEXT_FILTERS.select { |filter| filter[:name] == entity.text_filter }).first[:method].call(entity.send(text_method)).html_safe
  end
  
  def auto_discovery_link_tag
    super :rss, Setting.application.value(:feedburner_stub).nil? || Setting.application.value(:feedburner_stub).empty? ? { :controller => "blog", :format => "rss" } : feedburner_url
  end
end
