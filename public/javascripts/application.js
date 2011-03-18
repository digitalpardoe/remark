// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var Remark = {
  switchMarkItUp: function(textArea, setting) {
		$(textArea).parent().removeClass();
		$(textArea).parent().addClass(setting.toLowerCase());
    switch(setting.toLowerCase()) {
      case 'html':
        $(textArea).markItUp(myHtmlSettings);
        break;
      case 'markdown':
        $(textArea).markItUp(myMarkdownSettings);
        break;
      case 'textile' :
        $(textArea).markItUp(myTextileSettings);
        break;
    }
  }
};
