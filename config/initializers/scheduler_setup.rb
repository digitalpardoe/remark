SCHEDULER = Rufus::Scheduler.start_new

Article.unpublished.each do |article|
  article.schedule
end

Page.unpublished.each do |page|
  page.schedule
end
