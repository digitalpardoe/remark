//= require jquery
//= require rails-ujs
//= require jquery-ui/widgets/datepicker
//= require jquery-ui/widgets/slider
//= require jquery-ui/widgets/draggable
//= require jquery-ui-timepicker-addon
//= require bootstrap

window.Remark = {
  switchMarkItUp: function(textArea, setting) {
    $(textArea).parent().removeClass("html markdown textile");
    $('link[title="markitup"]').attr('href', '/markitup/sets/' + setting.toLowerCase() + '/style.css');
    switch (setting.toLowerCase()) {
      case "html":
        $(textArea).markItUp(myHtmlSettings);
        break;
      case "markdown":
        $(textArea).markItUp(myMarkdownSettings);
        break;
      case "textile":
        $(textArea).markItUp(myTextileSettings);
        break;
    }
  },

  elementToggler: function(configuration, buttons, setInitialState, clickHandler) {
    $(document).ready(function() {
      $(buttons).hide();
      for (var key in configuration) {
        $(configuration[key]).hide();
      }
      setInitialState(configuration, buttons);
      $(buttons + " .btn").click(function(event) {
        event.preventDefault();
        var clickedButton = event.target.className.replace("btn ", "");
        clickHandler(clickedButton);
        $(buttons).fadeToggle(200, function() {
          $(configuration[clickedButton]).fadeToggle(200);
        });
      });
    });
  }
};
