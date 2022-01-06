class ChartView
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
