//= require jquery
//= require jquery-ui/widgets/datepicker
//= require jquery-ui/widgets/slider
//= require jquery-ui/widgets/draggable
//= require jquery-ui-timepicker-addon
//= require bootstrap-sprockets
//= require easymde

window.Remark = {
  editors: {},

  initEditor: function(textAreaId, mode) {
    var textarea = document.querySelector(textAreaId);
    if (!textarea) return;

    // Destroy existing editor if any
    Remark.destroyEditor(textAreaId);

    if (mode === "markdown") {
      var editor = new EasyMDE({
        element: textarea,
        spellChecker: false,
        status: false,
        toolbar: ["bold", "italic", "heading", "|",
                  "quote", "unordered-list", "ordered-list", "|",
                  "link", "image", "|",
                  "code", "horizontal-rule", "|",
                  "preview", "side-by-side", "fullscreen", "|",
                  "guide"]
      });
      Remark.editors[textAreaId] = { type: "easymde", instance: editor };
    } else {
      // HTML and Textile: simple toolbar with wrap-tag buttons
      Remark.initSimpleToolbar(textarea, textAreaId, mode);
    }
  },

  destroyEditor: function(textAreaId) {
    var existing = Remark.editors[textAreaId];
    if (existing) {
      if (existing.type === "easymde") {
        existing.instance.toTextArea();
      } else if (existing.type === "simple") {
        var toolbar = existing.toolbar;
        if (toolbar && toolbar.parentNode) {
          toolbar.parentNode.removeChild(toolbar);
        }
      }
      delete Remark.editors[textAreaId];
    }
  },

  initSimpleToolbar: function(textarea, textAreaId, mode) {
    var buttons;
    if (mode === "html") {
      buttons = [
        { label: "B", before: "<strong>", after: "</strong>" },
        { label: "I", before: "<em>", after: "</em>" },
        { label: "H1", before: "<h1>", after: "</h1>" },
        { label: "H2", before: "<h2>", after: "</h2>" },
        { label: "H3", before: "<h3>", after: "</h3>" },
        { label: "Link", before: '<a href="">', after: "</a>" },
        { label: "Img", before: '<img src="', after: '" />' },
        { label: "UL", before: "<ul>\n<li>", after: "</li>\n</ul>" },
        { label: "OL", before: "<ol>\n<li>", after: "</li>\n</ol>" },
        { label: "Code", before: "<pre><code>", after: "</code></pre>" },
        { label: "P", before: "<p>", after: "</p>" },
        { label: "HR", before: "<hr />", after: "" },
        { label: "Blockquote", before: "<blockquote>", after: "</blockquote>" }
      ];
    } else {
      // Textile
      buttons = [
        { label: "B", before: "*", after: "*" },
        { label: "I", before: "_", after: "_" },
        { label: "H1", before: "h1. ", after: "" },
        { label: "H2", before: "h2. ", after: "" },
        { label: "H3", before: "h3. ", after: "" },
        { label: "Link", before: '"', after: '":http://' },
        { label: "Img", before: "!", after: "!" },
        { label: "UL", before: "* ", after: "" },
        { label: "OL", before: "# ", after: "" },
        { label: "Code", before: "@", after: "@" },
        { label: "Blockquote", before: "bq. ", after: "" }
      ];
    }

    var toolbar = document.createElement("div");
    toolbar.className = "simple-editor-toolbar btn-toolbar mb-2";

    buttons.forEach(function(btn) {
      var button = document.createElement("button");
      button.type = "button";
      button.className = "btn btn-sm btn-outline-secondary me-1 mb-1";
      button.textContent = btn.label;
      button.addEventListener("click", function(e) {
        e.preventDefault();
        Remark.wrapSelection(textarea, btn.before, btn.after);
      });
      toolbar.appendChild(button);
    });

    textarea.parentNode.insertBefore(toolbar, textarea);
    Remark.editors[textAreaId] = { type: "simple", toolbar: toolbar };
  },

  wrapSelection: function(textarea, before, after) {
    var start = textarea.selectionStart;
    var end = textarea.selectionEnd;
    var text = textarea.value;
    var selected = text.substring(start, end);
    var replacement = before + selected + after;
    textarea.value = text.substring(0, start) + replacement + text.substring(end);
    textarea.focus();
    textarea.selectionStart = start + before.length;
    textarea.selectionEnd = start + before.length + selected.length;
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
        var clickedButton = event.target.className.replace(/btn\s*|btn-secondary\s*/g, "").trim();
        clickHandler(clickedButton);
        $(buttons).fadeToggle(200, function() {
          $(configuration[clickedButton]).fadeToggle(200);
        });
      });
    });
  }
};
