import { Controller } from "@hotwired/stimulus";
import { v4 } from "uuid";

export default class extends Controller {
  connect() {
    const textareas = this.element.getElementsByTagName("textarea");
    if (textareas.length != 1)
      throw new Error("wysiwyg_controller shuld have 1 textarea");

    const textarea = textareas[0];
    const id = v4();
    textarea.id = id;
    this.selector = `#${id}`;
    tinymce.init({ selector: this.selector });
  }

  disconnect() {
    if (this.selector) tinymce.remove(this.selector);
  }
}
