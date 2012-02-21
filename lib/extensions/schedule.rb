module Schedule
  def schedule
    tag = generate_tag
    perform_unschedule(tag)

    SCHEDULER.at self.published_at, :tags => tag do
      # This needs to be made more intelligent (obviously)
      Rails.cache.clear
    end unless self.published_at <= Time.now
  end

  def unschedule
    perform_unschedule(generate_tag)
  end

  private
  def generate_tag
    "#{self.class.name.downcase!}_#{self.id}"
  end

  def perform_unschedule(tag)
    existing_jobs = SCHEDULER.find_by_tag(tag)

    # Make sure we don't duplicate jobs, last thing we need is the
    # cache getting cleared all the time
    if (existing_jobs.length > 0)
      existing_jobs.each do |job|
        job.unschedule
      end
    end
  end
end
