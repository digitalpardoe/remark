require 'Time'

module TimeZoned
  def unzone
    self.published_at = self.published_at.unzoned
  end
end