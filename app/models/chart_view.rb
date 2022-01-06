class ChartView
  DEFAULT_SINCE_OPTION = :one_year_ago

  SINCE_OPTIONS = [
    :one_month_ago,
    :three_months_ago,
    :six_months_ago,
    :one_year_ago,
    :two_years_ago,
    :five_years_ago,
    :all_time
  ].freeze

  def self.since_option_to_date(option) # rubocop:disable Metrics/MethodLength
    today = Time.zone.today
    option = option.to_sym

    option_date_hash = {
      one_month_ago: today.months_ago(1),
      three_months_ago: today.months_ago(3),
      six_months_ago: today.months_ago(6),
      one_year_ago: today.years_ago(1),
      two_years_ago: today.years_ago(2),
      five_years_ago: today.years_ago(5),
      all_time: nil
    }

    raise "Illegal since_option #{option}" unless option_date_hash.key? option

    option_date_hash[option]
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
