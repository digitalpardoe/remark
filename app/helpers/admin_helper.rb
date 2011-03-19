module AdminHelper
  def error_messages_for(model)
    if model.errors.any?
      content_tag :div, :id => 'error_explanation' do
        content_tag(:h2, "#{pluralize(model.errors.count, "error")} prohibited this #{model.class.model_name.human.downcase} from being saved:") \
        << content_tag(:ul, model.errors.full_messages.map { |message| content_tag(:li, "#{message}.") }.to_s.html_safe)
      end
    end
  end
  
  def anytime(form, text_fields)
    text_fields = [text_fields].flatten
    
    javascript_tag do 
      "".tap do |js|
        js << "$(document).ready(function() {"
        text_fields.each do |text_field|
          js << "AnyTime.picker(\"#{form.object_name}_#{text_field}\","
          js << "{ format: \"%a %d %b %Y at %H:%i\", firstDOW: 1 }"
          # js << "{ format: \"%d/%m/%Y at %H:%i\", firstDOW: 1 }"
          js << ");"
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
end
