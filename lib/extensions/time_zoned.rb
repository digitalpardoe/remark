class Time
	def zoned
    self.to_time.utc + Time.zone_offset(::ActiveSupport::TimeZone.create(Setting.application.value('time_zone')).formatted_offset)
  end

  def unzoned
    self.to_time.utc - Time.zone_offset(::ActiveSupport::TimeZone.create(Setting.application.value('time_zone')).formatted_offset)
  end
end

module TimeZoned
  def unzone
    self.published_at = self.published_at.unzoned
  end
end
