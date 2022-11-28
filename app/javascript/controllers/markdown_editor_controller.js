import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["viewer"];

  updateViewerContent(event) {
    const viewerController =
      this.application.getControllerForElementAndIdentifier(
        this.viewerTarget,
        "markdown-viewer"
      );
    if (viewerController == null) return;

    viewerController.updateContent(event.detail.text);
  }
}
