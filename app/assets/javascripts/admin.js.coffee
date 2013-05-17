#= require jquery
#= require jquery_ujs
#= require jquery.ui.datepicker
#= require jquery.ui.slider
#= require jquery.ui.draggable
#= require jquery-ui-timepicker-addon
#= require twitter/bootstrap

window.Remark =
  switchMarkItUp: (textArea, setting) ->
    $(textArea).parent().removeClass "html markdown textile"
    $('link[title="markitup"]').attr('href', '/markitup/sets/' + setting.toLowerCase() + '/style.css')
    switch setting.toLowerCase()
      when "html"
        $(textArea).markItUp myHtmlSettings
      when "markdown"
        $(textArea).markItUp myMarkdownSettings
      when "textile"
        $(textArea).markItUp myTextileSettings
      

  elementToggler: (configuration, buttons, setInitalState, clickHandler) ->
    $(document).ready ->
      $(buttons).hide()
      for key of configuration
        $(configuration[key]).hide()
      setInitalState configuration, buttons
      $(buttons + " .btn").click (event) ->
        event.preventDefault()
        clickedButton = event.target.className.replace("btn ", "")
        clickHandler(clickedButton)
        $(buttons).fadeToggle 200, ->
          $(configuration[clickedButton]).fadeToggle 200
