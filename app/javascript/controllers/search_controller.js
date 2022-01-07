import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input"];
  static values = { path: String };

  submit(e) {
    e.preventDefault();

    const query = this.inputTarget.value
      .split(" ")
      .filter((v) => v)
      .join("~");

    if (!query) return;

    const path = `${this.pathValue}${query}`;
    if (location.pathname !== path) Turbo.visit(path);
  }
}
