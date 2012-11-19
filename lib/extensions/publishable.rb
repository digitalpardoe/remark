module Publishable
  def name_id
    "#{self.class.name.downcase!}_#{self.id}"
  end

  def schedule
    unschedule
    Scheduler.add_publishable(self) do
      # This will have to do for now, Rails sweepers are tied to
      # controllers, will need to come up with a workaround
      Rails.cache.clear
    end unless self.published_at <= Time.now.utc || self.draft
  end

  def unschedule
    Scheduler.remove_publishable(self)
  end
end
