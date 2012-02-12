module Admin::SettingsHelper
  def field_for(setting, form)
    if setting.field_type
      field_type = setting.field_type.split('#').first
      option = setting.field_type.split('#').last
    end
    
    case field_type
      when "text_area"
        form.text_area(setting.id, :value => setting.value, :class => 'normal')
      when "url_field"
        form.url_field(setting.id, :value => setting.value)
      when "time_zone"
        select_tag("setting[#{setting.id}]", time_zone_options_for_select(setting.value))
      when "collection_select"
        case option
          when "model"
            eval "select_tag('setting[#{setting.id}]', options_from_collection_for_select(#{setting.key.camelize}.all, :id, :human_readable, setting.value))"
          when "constant"
            eval "form.select setting.id, #{setting.key.pluralize.upcase}.collect { |tf| [truncate(tf[:human_readable]), tf[:name]]}, { :selected => setting.value }"
        end
      else
        form.text_field(setting.id, :value => setting.value)
    end
  end
end
