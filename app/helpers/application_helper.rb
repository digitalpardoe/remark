module ApplicationHelper
  def tracking
    Setting.application.value(:tracking)
  end
end
