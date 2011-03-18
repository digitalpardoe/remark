module ApplicationHelper
  def tracking
    Setting.application.value(:tracking) unless Rails.env != 'production'
  end
  
  def name
    Setting.application.value(:name)
  end
  
  def markitup(form, text_areas, *options)
    text_areas = [text_areas].flatten
    options = options.extract_options!.stringify_keys
    toggle = options.delete("toggle")
    toggle_text = toggle ? "$(\"##{form.object_name}_#{toggle} option:selected\").text()" : "\"markdown\""
    
    javascript_tag do 
      "".tap do |js|
        js << "$(document).ready(function() {"
        text_areas.each { |text_area| js << "Remark.switchMarkItUp(\"##{form.object_name}_#{text_area}\", #{toggle_text});" }
        if toggle
          js << "$(\"##{form.object_name}_#{toggle}\").change(function() {"
          text_areas.each do |text_area|
            js << "$(\"##{form.object_name}_#{text_area}\").markItUpRemove();"
            js << "Remark.switchMarkItUp(\"##{form.object_name}_#{text_area}\", $(\"##{form.object_name}_#{toggle} option:selected\").text());"
          end
          js << "})"
        end
        js << "});"
      end.html_safe
    end
  end
end
