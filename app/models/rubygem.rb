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

  def weekly_downloads_data
    since = Time.zone.today.years_ago(1)
    daily_summaries = self.daily_summaries.where("date > ?", since).order(date: :desc)
    weekly_summary_data = DailySummary.daily_to_weekly_summary_data daily_summaries
    { name: name, summaries: weekly_summary_data }
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