module Admin::SettingsHelper
  def field_for(setting, form)
    if setting.field_type
      field_type = setting.field_type.split('#').first
      option = setting.field_type.split('#').last
    end
    
    classes = ["input-xlarge"]
    
    case field_type
      when "text_area"
        form.text_area(setting.id, :value => setting.value, :class => classes, :rows => 10)
      when "url_field"
        form.url_field(setting.id, :value => setting.value, :class => classes)
      when "time_zone"
        select_tag("setting[#{setting.id}]", time_zone_options_for_select(setting.value), :class => classes)
      when "collection_select"
        case option
          when "model"
            select_tag("setting[#{setting.id}]", options_from_collection_for_select(Object.const_get(setting.key.camelize.to_sym).all, :id, :human_readable, setting.value), :class => classes)
          when "constant"
            form.select setting.id, Object.const_get(setting.key.pluralize.upcase.to_sym).collect { |tf| [truncate(tf[:human_readable]), tf[:name]] }, { :selected => setting.value }, :class => classes
          when "stylesheet"
            select_tag("setting[#{setting.id}]", options_for_select(Stylesheet.available.collect { |x| [x, x] }, :selected => setting.value ), :class => classes)
        end
      else
        form.text_field(setting.id, :value => setting.value, :class => classes)
    end
  end
end
