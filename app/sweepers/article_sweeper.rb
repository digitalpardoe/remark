class ArticleSweeper < ActionController::Caching::Sweeper
  observe Article
  
  def after_create(article)
    expire_cache_for(article)
  end
  
  def after_update(article)
    expire_cache_for(article)
  end
  
  def after_destroy(article)
    expire_cache_for(article)
  end
  
  private
  def expire_cache_for(article)
    expire_action(:controller => '/blog', :action => 'index')
    expire_action(:controller => '/blog', :action => 'index', :format => 'rss')
    expire_action(:controller => '/blog', :action => 'show', :day => article.published_at.strftime("%d"), :month => article.published_at.strftime("%m"), :year => article.published_at.strftime("%Y"), :permalink => article.permalink)  
    
    if Setting.application.value(:per_page).to_i > 0
      (1..(Article.published.count / Setting.application.value(:per_page).to_i)).each do |i|
        expire_action(:controller => '/blog', :action => 'index', :page => i)
      end
    end
  end
end
