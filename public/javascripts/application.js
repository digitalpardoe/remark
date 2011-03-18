// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var Remark = {
  switchMarkItUp: function(textArea, setting) {
		chosenSetting = setting.toLowerCase();
		$(textArea).parent().removeClass();
		$(textArea).parent().addClass(chosenSetting);
    switch(chosenSetting) {
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
