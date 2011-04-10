module ApplicationHelper
  def tracking
    Setting.application.value(:tracking) unless Rails.env != 'production'
  end
  
  def name
    Setting.application.value(:name)
  end
  
  def article_path(article)
    super :day => article.published_at.strftime("%d"), :month => article.published_at.strftime("%m"), :year => article.published_at.strftime("%Y"), :permalink => article.permalink
  end
  
  def article_url(article)
    "http://" + Setting.application.value(:url) + article_path(article)
  end
end
