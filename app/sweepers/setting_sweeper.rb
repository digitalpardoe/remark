class SettingSweeper < ActionController::Caching::Sweeper
  observe Setting
  
  # Changing settings could cause everything cached by the website
  # to change so we have to clear all caches, we don't do this with
  # regex because we want the clearing to work with memcached
  
  def after_create(setting)
    expire_cache_for(setting)
  end
  
  def after_update(setting)
    expire_cache_for(setting)
  end
  
  def after_destroy(setting)
    expire_cache_for(setting)
  end
  
  private
  def expire_cache_for(setting)
    # Expire all article caches
    Article.published.all.each do |article|
      expire_action(:controller => '/blog', :action => 'show', :day => article.published_at.strftime("%d"), :month => article.published_at.strftime("%m"), :year => article.published_at.strftime("%Y"), :permalink => article.permalink)  
    end
    
    expire_action(:controller => '/blog', :action => 'index')
    expire_action(:controller => '/blog', :action => 'index', :format => 'rss')
    
    if Setting.application.value(:per_page).to_i > 0
      (1..(Article.published.count / Setting.application.value(:per_page).to_i)).each do |i|
        expire_action(:controller => '/blog', :action => 'index', :page => i)
      end
    end
        
    # Expire all page caches
    Page.published.all.each do |page|
      expire_action(:controller => '/page', :action => 'show', :permalink => page.permalink)
    end
  end
end
