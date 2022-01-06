class ChartView
  DEFAULT_PERIOD = :one_year

  PERIODS = [
    :one_month,
    :three_months,
    :six_months,
    :one_year,
    :two_years,
    :five_years,
    :all_time
  ].freeze

  def self.period_to_date(period) # rubocop:disable Metrics/MethodLength
    today = Time.zone.today
    period = period.to_sym

    period_date_hash = {
      one_month: today.months_ago(1),
      three_months: today.months_ago(3),
      six_months: today.months_ago(6),
      one_year: today.years_ago(1),
      two_years: today.years_ago(2),
      five_years: today.years_ago(5),
      all_time: nil
    }

    raise "Illegal period #{period}" unless period_date_hash.key? period

    period_date_hash[period]
  end

  attr_accessor :raw_query, :rubygems

  def initialize(raw_query:)
    self.raw_query = raw_query
  end

  def query
    @query ||= raw_query.downcase
  end

  def gemnames
    @gemnames ||= query.split("~")
  end

  def prepare_rubygems!
    self.rubygems ||= gemnames.map do |gemname|
      Rubygem.find_or_create_by! name: gemname
    end
  end
end
