module ApplicationHelper
  def tracking
    Setting.application.value(:tracking) unless Rails.env != 'production'
  end
end
