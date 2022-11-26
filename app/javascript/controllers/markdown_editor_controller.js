import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.viewerElement = this.element.querySelector(
      "[data-controller='markdown-viewer']"
    );
  }

  updateViewerContent(event) {
    this.viewerElement.setAttribute(
      "data-markdown-viewer-content-value",
      event.detail.text
    );
  }
}
