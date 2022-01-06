class ChartController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @chart_view = ChartView.new raw_query: params[:query]
    @chart_view.prepare_rubygems!

    rubygems = @chart_view.rubygems
    rubygems.each(&:fetch_if_need!)
    @weekly_downloads_data = rubygems.map(&:weekly_downloads_data)
  end
end
