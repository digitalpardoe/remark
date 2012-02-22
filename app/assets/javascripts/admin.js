//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree .
//= require twitter/bootstrap 

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
      case 'textile':
        $(textArea).markItUp(myTextileSettings);
        break;
    }
  }
};
