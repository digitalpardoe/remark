class Scheduler
  class << self
    def jobs
      SCHEDULER.jobs
    end

    def add_publishable(item, &block)
      remove_publishable(item)
      SCHEDULER.at item.published_at, :tags => item.name_id do
        block.call
      end
    end

    def remove_publishable(item)
      SCHEDULER.find_by_tag(item.name_id).each do |job|
        job.unschedule
      end
    end
  end
end
