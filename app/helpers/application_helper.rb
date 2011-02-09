module ApplicationHelper
  def tracking
    Setting.application.value(:tracking) unless Rails.env != 'production'
  end
  
  def name
    Setting.application.value(:name)
  end
end
