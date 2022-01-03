class Rubygem < ApplicationRecord
  has_many :daily_summaries, dependent: :destroy

  def fetch_if_need!
    return if last_fetch_date == Time.zone.today

    source_data = fetch_source_data
    daily_summaries = DailySummary.build_from_source_data source_data, last_summary, self
    self.last_fetch_date = Time.zone.today
    transaction do
      save!
      DailySummary.import! daily_summaries
    end
  end

  def daily_downloads_data
    summaries = daily_summaries.order(date: :desc).filter.with_index do |_, index|
      (index % 7).zero?
    end
    summaries.map! do |summary|
      { date: summary.date, count: summary.daily_downloads }
    end
    summaries.reverse!
    { name: name, summaries: summaries }
  end

  private

  def last_summary
    daily_summaries.order(:date).last
  end

  def fetch_source_data
    res = Faraday.get "https://bestgems.org/api/v1/gems/#{name}/total_downloads.json"
    JSON.parse res.body
  end
end
