module Publishable
  def name_id
    "#{self.class.name.downcase!}_#{self.id}"
  end

  def schedule
    unschedule
    Scheduler.add_publishable(self) do
      # This is where we'll probably sort out the cache
    end unless self.published_at <= Time.now.utc || self.draft
  end

  def unschedule
    Scheduler.remove_publishable(self)
  end
end
