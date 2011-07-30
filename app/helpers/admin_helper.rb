module AdminHelper
  def error_messages_for(model)
    if model.errors.any?
      content_tag :div, :id => 'error_explanation' do
        "".tap do |string|
          string << content_tag(:h2, "Please correct the following #{pluralize(model.errors.count, "error")}, to allow this #{model.class.model_name.human.downcase} to be saved:")
          string << content_tag(:ul, "".tap { |li| model.errors.full_messages.each { |item| li << content_tag(:li, item) } }.html_safe )
        end.html_safe
      end
    end
  end
  
  def anytime(form, text_fields)
    text_fields = [text_fields].flatten
    date_format = "format: \"%a %d %b %Y at %H:%i %@\""

    javascript_tag do 
      "".tap do |js|
        js << "$(document).ready(function() {"
        text_fields.each do |text_field|
          object_name = "#{form.object_name}_#{text_field}"
          js << "AnyTime.picker(\"#{object_name}\","
          js << "{ #{date_format}, firstDOW: 1 }"
          js << ");"
          js << "$(\"input##{object_name}\").each(function() {"
          js << "var converter = new AnyTime.Converter({#{date_format}});"
          js << "$(this).val( converter.format(converter.parse($(this).val() + \" UTC+00:00\")) );"
          js << "});"
        end
        js << "});"
      end.html_safe
    end
  end
  
  def nav_link(text, controller_name)
    if controller.controller_name == controller_name
      eval "link_to \"#{text}\", admin_#{controller_name}_path, :class => \"active\""
    else
      eval "link_to \"#{text}\", admin_#{controller_name}_path"
    end
  end
  
  def markitup(form, text_areas, *options)
    text_areas = [text_areas].flatten
    options = options.extract_options!.stringify_keys
    toggle = options.delete("toggle")
    toggle_text = toggle ? "$(\"##{form.object_name}_#{toggle} option:selected\").text()" : "\"#{DEFAULT_TEXT_FILTER}\""
    
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
