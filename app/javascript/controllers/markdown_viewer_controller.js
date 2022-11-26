import { Controller } from "@hotwired/stimulus";
import { marked } from "marked";
import DOMPurify from "dompurify";

export default class extends Controller {
  static values = { content: String };

  contentValueChanged() {
    this.element.innerHTML = DOMPurify.sanitize(marked(this.contentValue));
    window.Prism.highlightAllUnder(this.element);
  }

  updateContent(text) {
    this.contentValue = text;
  }
}
