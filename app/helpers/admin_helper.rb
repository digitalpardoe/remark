module AdminHelper
  def error_messages_for(model)
    if model.errors.any?
      content_tag :div, :id => 'error_explanation' do
        content_tag(:h2, "#{pluralize(model.errors.count, "error")} prohibited this #{model.class.model_name.human.downcase} from being saved:") \
        << content_tag(:ul, model.errors.full_messages.map { |message| content_tag(:li, "#{message}.") }.to_s.html_safe)
      end
    end
  end
  
  def markitup(form, text_areas, toggle)
    javascript_tag do 
      "".tap do |js|
        js << "$(document).ready(function() {"
        text_areas.each { |text_area| js << "Remark.switchMarkItUp(\"##{form.object_name}_#{text_area}\", $(\"##{form.object_name}_#{toggle} option:selected\").text());" }
        js << "$(\"##{form.object_name}_#{toggle}\").change(function() {"
        text_areas.each do |text_area|
          js << "$(\"##{form.object_name}_#{text_area}\").markItUpRemove();"
          js << "Remark.switchMarkItUp(\"##{form.object_name}_#{text_area}\", $(\"##{form.object_name}_#{toggle} option:selected\").text());"
        end
        js << "})});"
      end.html_safe
    end
  end
end
