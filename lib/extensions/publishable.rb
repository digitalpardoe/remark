module Publishable
  def name_id
    "#{self.class.name.downcase!}_#{self.id}"
  end

  def schedule
    Scheduler.add_publishable(self) do
      Rails.cache.clear
    end unless self.published_at <= Time.now || self.draft
  end

  def unschedule
    Scheduler.remove_publishable(self)
  end
end
