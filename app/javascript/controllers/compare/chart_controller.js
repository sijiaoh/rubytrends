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
    const datasets = this.dataValue.map(({ name, summaries }, index) => {
      const color = seq[(index * 2) % 11];
      return {
        label: name,
        data: summaries.map(({ date, count }) => ({ x: date, y: count })),
        tension: 0.5,
        backgroundColor: `#${color}`,
        borderColor: `#${color}`,
        hoverRadius: 6,
      };
    });

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
