class Rubygem < ApplicationRecord
  has_many :daily_summaries, dependent: :destroy

  def fetch_if_need!
    return if last_fetch_date != Time.zone.today
    # TODO: fetch data from bestgems.org
  end

  def daily_downloads_data
    summaries = daily_summaries.map do |summary|
      { date: summary.date, count: summary.daily_downloads }
    end
    { name: name, summaries: summaries }
  end
end
