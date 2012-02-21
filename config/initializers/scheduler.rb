SCHEDULER = Rufus::Scheduler.start_new

Article.where(:draft => false).where('published_at > ?', Time.now).each do |article|
  SCHEDULER.at article.published_at, :tags => Schedule::Utils.generate_tag(article) do
    Rails.cache.clear
  end
end

Page.where(:draft => false).where('published_at > ?', Time.now).each do |page|
  SCHEDULER.at page.published_at, :tags => Schedule::Utils.generate_tag(page) do
    Rails.cache.clear
  end
end
