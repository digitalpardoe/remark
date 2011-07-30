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
    # Should expire all the action & fragment caches
    expire_fragment(/.*/)
  end
end
