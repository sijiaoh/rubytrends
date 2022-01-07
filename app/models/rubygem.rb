class Rubygem < ApplicationRecord
  has_many :daily_summaries, dependent: :destroy
  validates :name, format: { with: /\A[a-z\-_]+\z/ }

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

  def weekly_downloads_data(period)
    daily_summaries = self.daily_summaries.order(date: :desc)
    daily_summaries = daily_summaries.where("date > ?", period) if period.present?
    weekly_summary_data = DailySummary.daily_to_weekly_summary_data daily_summaries
    { name: name, summaries: weekly_summary_data }
  end

  private

  def last_summary
    daily_summaries.order(:date).last
  end

  def fetch_source_data
    raise "Should mock Rubygem#fetch_source_data in test." if Rails.env.test?

    res = Faraday.get "https://bestgems.org/api/v1/gems/#{name}/total_downloads.json"
    JSON.parse res.body
  end
end
