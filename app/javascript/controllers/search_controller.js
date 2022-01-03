import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input"];
  static values = { path: String };

  submit() {
    const query = this.inputTarget.value
      .split(" ")
      .filter((v) => v)
      .join("~");

    if (!query) return;

    Turbo.visit(`${this.pathValue}${query}`);
  }
}
