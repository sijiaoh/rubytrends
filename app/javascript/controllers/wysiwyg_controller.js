import { Controller } from "@hotwired/stimulus";
import { v4 } from "uuid";

export default class extends Controller {
  async connect() {
    const textareas = this.element.getElementsByTagName("textarea");
    if (textareas.length != 1)
      throw new Error("wysiwyg_controller shuld have 1 textarea");

    const textarea = textareas[0];
    const id = v4();
    textarea.id = id;
    this.selector = `#${id}`;

    await tinymce.init({
      selector: this.selector,
      menubar: false,
      statusbar: false,

      setup: this.editorSetup,

      plugins: ["autoresize", "table"],
      min_height: 500,
      autoresize_bottom_margin: 0,

      toolbar: [
        "undo",
        "redo",
        "|",
        "h2",
        "h3",
        "alignleft",
        "aligncenter",
        "alignright",
        "|",
        "bold",
        "italic",
        "|",
        "table",
      ].join(" "),
    });
  }

  editorSetup(editor) {
    editor.on("keydown", function (event) {
      // Always use p tag to newline.
      const enter = 13;
      if (event.keyCode == enter && event.shiftKey) {
        event.shiftKey = false;
      }
    });
  }

  disconnect() {
    if (this.selector) tinymce.remove(this.selector);
  }
}
