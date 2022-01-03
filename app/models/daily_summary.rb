class DailySummary < ApplicationRecord
  belongs_to :rubygem

  def self.build_from_source_data(source_data, existing_last_summary, rubygem)
    index = if existing_last_summary
              source_data.find_index { |datum| datum["date"] == existing_last_summary.date.strftime("%Y-%m-%d") }
            end
    prev_summary = existing_last_summary
    source_data[0...index].reverse.map do |datum|
      daily_downloads = calc_daily_downloads datum, prev_summary
      prev_summary = build_from_source_datum datum, daily_downloads, rubygem
    end
  end

  def self.calc_daily_downloads(datum, prev_summary)
    first_summary_daily_downloads = 0
    if prev_summary.blank?
      first_summary_daily_downloads
    else
      datum["total_downloads"] - prev_summary.total_downloads
    end
  end

  def self.build_from_source_datum(source_datum, daily_downloads, rubygem)
    new(
      date: source_datum["date"],
      total_downloads: source_datum["total_downloads"],
      daily_downloads: daily_downloads,
      rubygem: rubygem
    )
  end
end
