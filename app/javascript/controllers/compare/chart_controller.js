import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from "chart.js";

Chart.register(...registerables);

export default class extends Controller {
  static targets = ["chart"];
  static values = { data: Array };

  connect() {
    const datasets = this.dataValue.map(({ name, summaries }) => ({
      label: name,
      data: summaries.map(({ count }) => count),
    }));
    const data = {
      labels: ["1", "2", "3", "4", "5", "6", "7"],
      datasets,
    };
    const config = {
      type: "line",
      data,
      options: {
        interaction: {
          mode: "index",
          intersect: false,
        },
      },
    };
    new Chart(this.chartTarget, config);
  }
}
