return if %w[development test].include? ENV["RAILS_ENV"]

data = [
  {
    gemname: "a",
    existence_days: 4
  },
  {
    gemname: "b",
    existence_days: 1
  },
  {
    gemname: "c",
    existence_days: 6
  }
]

data.each do |datum|
  rubygem = Rubygem.create! name: datum[:gemname]

  total_downloads = 0
  datum[:existence_days].times do |count|
    date = Time.zone.today.prev_day count + 1
    daily_downloads = rand 100
    total_downloads += daily_downloads
    DailySummary.create!(
      rubygem: rubygem,
      date: date,
      total_downloads: total_downloads,
      daily_downloads: daily_downloads
    )
  end
end
