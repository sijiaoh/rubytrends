class ChartController < ApplicationController
  def index
    @chart_view = ChartView.new raw_query: params[:query]
    @chart_view.prepare_rubygems!

    rubygems = @chart_view.rubygems
    rubygems.each(&:fetch_if_need!)

    period = ChartView.period_to_date params[:period]
    @weekly_downloads_data = rubygems.map { |rubygem| rubygem.weekly_downloads_data period }
  end
end
