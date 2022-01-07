import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["select"];
  static values = { path: String };

  connect() {
    this.change();
  }

  change() {
    const path = this.pathValue.replace(":period", this.selectTarget.value);
    const chartElm = document.getElementById("chart");
    chartElm.src = path;
  }
}
