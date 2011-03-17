module Admin::SettingsHelper
  def field_for(setting, form)
    case setting.field_type
      when "text_area"
        form.text_area(setting.id, :value => setting.value, :cols => 40, :rows => 5)
      when "url_field"
        form.url_field(setting.id, :value => setting.value, :size => 50)
      when "collection_select"
        eval "select_tag('setting[#{setting.id}]', options_from_collection_for_select(#{setting.key.camelize}.all, :id, :human_readable, setting.value))"
      else
        form.text_field(setting.id, :value => setting.value, :size => 50)
    end
  end
end
