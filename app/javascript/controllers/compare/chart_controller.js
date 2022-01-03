import { Controller } from "@hotwired/stimulus";
import { Chart, registerables } from "chart.js";
import palette from "google-palette";

Chart.register(...registerables);

export default class extends Controller {
  static targets = ["chart"];
  static values = { data: Array };

  connect() {
    const datesArray = this.dataValue.map(({ summaries }) =>
      summaries.map(({ date }) => date)
    );
    const labels = datesArray.sort((a, b) => b.length - a.length)[0];

    const seq = palette("cb-Paired", 11);
    const datasets = this.dataValue.map(({ name, summaries }, index) => ({
      label: name,
      data: summaries.map(({ date, count }) => ({ x: date, y: count })),
      tension: 0.4,
      backgroundColor: `#${seq[index]}`,
      borderColor: `#${seq[index]}`,
      hoverRadius: 6,
    }));

    const config = {
      type: "line",
      data: { labels, datasets },
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
