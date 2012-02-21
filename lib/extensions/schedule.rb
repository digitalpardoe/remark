module Schedule
  def schedule
    unschedule
    SCHEDULER.at self.published_at, :tags => Utils.generate_tag(self) do
      # This needs to be made more intelligent (obviously)
      Rails.cache.clear
    end unless self.published_at <= Time.now || self.draft
  end

  def unschedule
    # Make sure we don't duplicate jobs, last thing we need is the
    # cache getting cleared all the time
    SCHEDULER.find_by_tag(Utils.generate_tag(self)).each do |job|
      job.unschedule
    end
  end
  
  module Utils
    class << self
      def generate_tag(object)
        "#{object.class.name.downcase!}_#{object.id}"
      end
    end
  end
end
