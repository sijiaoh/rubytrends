# == Schema Information
#
# Table name: daily_summaries
#
#  id              :bigint           not null, primary key
#  total_downloads :bigint           not null
#  daily_downloads :bigint           not null
#  date            :date             not null
#  rubygem_id      :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class DailySummary < ApplicationRecord
  class << self
    def build_from_source_data(source_data, existing_last_summary, rubygem)
      index = if existing_last_summary
                source_data.find_index { |datum| datum["date"] == existing_last_summary.date.strftime("%Y-%m-%d") }
              end
      prev_summary = existing_last_summary
      source_data[0...index].reverse.map do |datum|
        daily_downloads = calc_daily_downloads datum, prev_summary
        prev_summary = build_from_source_datum datum, daily_downloads, rubygem
      end
    end

    def daily_to_weekly_summary_data(daily_summaries)
      weekly_summaries = daily_summaries.each_with_object([]).with_index do |(summary, arr), index|
        if (index % 7).zero?
          arr << { date: summary.date, count: summary.daily_downloads }
        else
          arr.last[:count] += summary.daily_downloads
        end
      end

      # Last data may be less than 7 days, so deleted.
      weekly_summaries.pop
      weekly_summaries.reverse
    end

    private

    def calc_daily_downloads(datum, prev_summary)
      first_summary_daily_downloads = 0
      if prev_summary.blank?
        first_summary_daily_downloads
      else
        datum["total_downloads"] - prev_summary.total_downloads
      end
    end

    def build_from_source_datum(source_datum, daily_downloads, rubygem)
      new(
        date: source_datum["date"],
        total_downloads: source_datum["total_downloads"],
        daily_downloads:,
        rubygem:
      )
    end
  end

  belongs_to :rubygem
end
