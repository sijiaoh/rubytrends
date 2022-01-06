class CompareController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @chart_view = ChartView.new raw_query: params[:query]
    @chart_view.prepare_rubygems!
    QueryCount.count_query! @chart_view.query
  end
end
