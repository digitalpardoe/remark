module Schedule
  def schedule
    unschedule
    SCHEDULER.at self.published_at, :tags => generate_tag do
      # This needs to be made more intelligent (obviously)
      Rails.cache.clear
    end unless self.published_at <= Time.now || self.draft
  end

  def unschedule
    # Make sure we don't duplicate jobs, last thing we need is the
    # cache getting cleared all the time
    SCHEDULER.find_by_tag(generate_tag).each do |job|
      job.unschedule
    end
  end

  private
  def generate_tag
    "#{self.class.name.downcase!}_#{self.id}"
  end
end
