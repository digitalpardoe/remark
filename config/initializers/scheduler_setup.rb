SCHEDULER = Rufus::Scheduler.start_new

# We need to stop this from killing everything if the
# environment is not yet set up
begin
  Article.unpublished.each do |article|
    article.schedule
  end

  Page.unpublished.each do |page|
    page.schedule
  end
rescue
end
