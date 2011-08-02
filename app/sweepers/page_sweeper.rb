class PageSweeper < ActionController::Caching::Sweeper
  observe Page
  
  def after_create(page)
    expire_cache_for(page)
  end
  
  def after_update(page)
    expire_cache_for(page)
  end
  
  def after_destroy(page)
    expire_cache_for(page)
  end
  
  private
  def expire_cache_for(page)
    expire_action(:controller => '/page', :action => 'show', :permalink => page.permalink)  
    
    # Will also need to expire article caches to refresh links in navigation bar
    Article.published.all.each do |article|
      expire_action(:controller => '/blog', :action => 'show', :day => article.published_at.strftime("%d"), :month => article.published_at.strftime("%m"), :year => article.published_at.strftime("%Y"), :permalink => article.permalink)  
    end
    
    expire_action(:controller => '/blog', :action => 'index')
    
    (1..(Article.published.count / Setting.application.value(:per_page).to_i)).each do |i|
      expire_action(:controller => '/blog', :action => 'index', :page => i)
    end
  end
end
