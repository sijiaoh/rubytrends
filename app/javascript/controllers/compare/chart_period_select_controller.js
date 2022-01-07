import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["select"];
  static values = { path: String };

  connect() {
    const storedPeriod = localStorage.getItem("period");
    if (storedPeriod != null) this.selectTarget.value = storedPeriod;

    this.change();
  }

  change() {
    localStorage.setItem("period", this.selectTarget.value);

    const path = this.pathValue.replace(":period", this.selectTarget.value);
    const chartElm = document.getElementById("chart");
    chartElm.src = path;
  }
}
