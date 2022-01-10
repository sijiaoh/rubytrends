import { Controller } from "@hotwired/stimulus";
import { v4 } from "uuid";
import { get_importmap } from "utils/get_importmap";

export default class extends Controller {
  static values = { bodyClass: String, contentCss: Array };

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

      body_class: this.bodyClassValue,
      content_css: this.contentCssValue,

      setup: this.editorSetup,

      plugins: ["autoresize", "link", "table", "lists", "paste", "codesample"],
      min_height: 500,
      autoresize_bottom_margin: 0,

      toolbar: [
        "undo redo",
        "alignleft aligncenter alignright",
        "h2 h3",
        "bold italic underline strikethrough",
        "forecolor backcolor link",
        "bullist numlist table codesample",
      ].join(" | "),

      default_link_target: "_blank",
      link_default_protocol: "https",
      paste_as_text: true,

      table_appearance_options: false,
      table_advtab: false,
      table_cell_advtab: false,
      table_row_advtab: false,
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
