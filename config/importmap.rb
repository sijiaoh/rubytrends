# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

pin_all_from "app/javascript/utils", under: "utils"

pin "google_analytics", to: "google_analytics.js"

pin "chart.js", to: "https://ga.jspm.io/npm:chart.js@3.7.0/dist/chart.esm.js"
pin "google-palette", to: "https://ga.jspm.io/npm:google-palette@1.1.0/palette.js"
