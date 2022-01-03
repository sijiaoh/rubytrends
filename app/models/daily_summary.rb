class DailySummary < ApplicationRecord
  belongs_to :rubygem

  def self.build_from_source_data(source_data, existing_last_summary, rubygem)
    index = if existing_last_summary
              source_data.find_index { |datum| datum["date"] == existing_last_summary.date.strftime("%Y-%m-%d") }
            end
    prev_summary = existing_last_summary
    source_data[0...index].reverse.map do |datum|
      daily_downloads = prev_summary.blank? ? 0 : datum["total_downloads"] - prev_summary.total_downloads
      prev_summary = build_from_source_datum datum, daily_downloads, rubygem
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
