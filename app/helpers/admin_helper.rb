module AdminHelper
  BOOTSTRAP_ICONS = {
    icon_pencil: '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16"><path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325"/></svg>',
    icon_file: '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark" viewBox="0 0 16 16"><path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5z"/></svg>',
    icon_upload: '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-upload" viewBox="0 0 16 16"><path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5"/><path d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708z"/></svg>',
    icon_user: '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16"><path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/></svg>',
    icon_remove: '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/><path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/></svg>',
    icon_ok: '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-lg" viewBox="0 0 16 16"><path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425z"/></svg>',
    icon_arrow_up: '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5"/></svg>',
    icon_arrow_down: '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1"/></svg>'
  }.freeze

  def error_messages_for(model)
    if model.errors.any?
      content_tag :div, :class => ["alert", "alert-danger"] do
        "".tap do |string|
          string << content_tag(:h4, "Please correct the following #{pluralize(model.errors.count, "error")}, to allow this #{model.class.model_name.human.downcase} to be saved:", :class => "alert-heading")
          string << content_tag(:ul, "".tap { |li| model.errors.full_messages.each { |item| li << content_tag(:li, item) } }.html_safe )
        end.html_safe
      end
    end
  end

  def datetime(form, text_fields)
    text_fields = [text_fields].flatten

    javascript_tag do
      "".tap do |js|
        js << "$(document).ready(function() {"
        text_fields.each do |text_field|
          object_name = "#{form.object_name}_#{text_field}"
          js << "$('##{object_name}').datetimepicker({"
          js << "separator: ' at ',"
          js << "dateFormat: 'dd/mm/yy',"
          js << "firstDay: 1"
          js << "});"
        end
        js << "});"
      end.html_safe
    end
  end

  def nav_link(text, controller_name)
    if controller.controller_name == controller_name
      content_tag(:li, link_to(text, send("admin_#{controller_name}_path"), :class => "nav-link active"), :class => "nav-item")
    else
      content_tag(:li, link_to(text, send("admin_#{controller_name}_path"), :class => "nav-link"), :class => "nav-item")
    end
  end

  def markitup(form, text_areas, *options)
    text_areas = [text_areas].flatten
    options = options.extract_options!.stringify_keys
    toggle = options.delete("toggle")
    toggle_text = toggle ? "$(\"##{form.object_name}_#{toggle} option:selected\").text().toLowerCase()" : "\"#{DEFAULT_TEXT_FILTER}\""

    javascript_tag do
      "".tap do |js|
        js << "$(document).ready(function() {"
        text_areas.each { |text_area| js << "Remark.initEditor(\"##{form.object_name}_#{text_area}\", #{toggle_text});" }
        if toggle
          js << "$(\"##{form.object_name}_#{toggle}\").change(function() {"
          text_areas.each do |text_area|
            js << "Remark.initEditor(\"##{form.object_name}_#{text_area}\", $(\"##{form.object_name}_#{toggle} option:selected\").text().toLowerCase());"
          end
          js << "});"
        end
        js << "});"
      end.html_safe
    end
  end

  def iconify(icon, text=nil)
    "".tap do |tag|
      tag << (BOOTSTRAP_ICONS[icon.to_sym] || "")
      if (text)
        tag << " #{text}"
      end
    end.html_safe
  end
end
