//= require jquery
//= require jquery_ujs
//= require_tree .
//= require twitter/bootstrap
//= require bootstrap-datetimepicker

var Remark = {
	switchMarkItUp: function(textArea, setting) {
		$(textArea).parent().removeClass('html markdown textile');
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
	},
  
  elementToggler: function(configuration, buttons, setInitalState) {
    $(document).ready(function() {
      $(buttons).hide();
    
      for (var key in configuration) {
        $(configuration[key]).hide();
      }
      
      setInitalState(configuration, buttons);
    
      $(buttons + " .btn").click(function(event) {
        event.preventDefault();
        $(buttons).fadeToggle(200, function() {
          $(configuration[event.target.className.replace("btn ", "")]).fadeToggle(200);
        });
      });
    });
  }
};
