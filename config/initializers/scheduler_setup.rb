SCHEDULER = Rufus::Scheduler.start_new

# Set up any jobs that may already exists, make sure we
# take the user's time zone setting into account though
Time.zone = Setting.application.value(:time_zone)

Article.unpublished.each do |article|
  article.schedule
end

Page.unpublished.each do |page|
  page.schedule
end
