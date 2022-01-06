class ChartController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @chart_view = ChartView.new raw_query: params[:query]
    @chart_view.prepare_rubygems!

    rubygems = @chart_view.rubygems
    rubygems.each(&:fetch_if_need!)

    since = ChartView.since_option_to_date params[:since]
    @weekly_downloads_data = rubygems.map { |rubygem| rubygem.weekly_downloads_data since }
  end
end
