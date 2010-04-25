module AdminHelper
  def error_messages_for(model)
    if model.errors.any?
      content_tag :div, :id => 'error_explanation' do
        content_tag(:h2, "#{pluralize(model.errors.count, "error")} prohibited this #{model.class.model_name.human.downcase} from being saved:") \
        << content_tag(:ul, model.errors.full_messages.map { |message| content_tag(:li, "#{message}.") }.to_s.html_safe)
      end
    end
  end
end
