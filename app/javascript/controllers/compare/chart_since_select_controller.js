import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["select"];
  static values = { path: String };

  change() {
    const path = this.pathValue.replace(":since", this.selectTarget.value);
    const chartElm = document.getElementById("chart");
    chartElm.src = path;
  }
}
