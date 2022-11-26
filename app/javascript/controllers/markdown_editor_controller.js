import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.editorElement = this.element.querySelector(
      "[data-controller='code-editor']"
    );
    this.viewerElement = this.element.querySelector(
      "[data-controller='markdown-viewer']"
    );
    this.onCodeEditorUpdate = (event) => {
      this.#updateViewerContent(event.detail.text);
    };
    this.#registerEditorEvent();
  }

  disconnect() {
    this.#unregisterEditorEvent();
  }

  #updateViewerContent(text) {
    this.viewerElement.setAttribute("data-markdown-viewer-content-value", text);
  }

  #registerEditorEvent() {
    this.editorElement.addEventListener(
      "codeEditorUpdate",
      this.onCodeEditorUpdate
    );
  }

  #unregisterEditorEvent() {
    this.editorElement.removeEventListener(
      "codeEditorUpdate",
      this.onCodeEditorUpdate
    );
  }
}
