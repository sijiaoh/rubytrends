class ChartController < ApplicationController
  include RubygemSetters

  skip_before_action :authenticate_user!
  before_action :set_rubygems, only: :index

  def index
    @weekly_downloads_data = @rubygems.map(&:weekly_downloads_data)
  end
end
