//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree .
//= require twitter/bootstrap 

@Remark =
	switchMarkItUp: (textArea, setting) ->
		$(textArea).parent().removeClass()
		$(textArea).parent().addClass setting.toLowerCase
		switch setting.toLowerCase()
			when 'html' then $(textArea).markItUp myHtmlSettings
			when 'markdown' then $(textArea).markItUp myMarkdownSettings
			when 'textile' then $(textArea).markItUp myTextileSettings
			else
		undefined
