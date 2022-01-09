import { Controller } from "@hotwired/stimulus";
import { v4 } from "uuid";
import { get_importmap } from "utils/get_importmap";

export default class extends Controller {
  async connect() {
    const textareas = this.element.getElementsByTagName("textarea");
    if (textareas.length != 1)
      throw new Error("wysiwyg_controller shuld have 1 textarea");

    const textarea = textareas[0];
    const id = v4();
    textarea.id = id;
    this.selector = `#${id}`;

    const importmap = get_importmap();
    const language = "ja";
    const language_url = importmap.imports[`tinymce_languages/${language}`];

    await tinymce.init({
      language,
      language_url,

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
