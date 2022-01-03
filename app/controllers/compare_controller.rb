class CompareController < ApplicationController
  skip_before_action :authenticate_user!
  set_rubygems_actions = :index
  before_action :set_gemnames, only: set_rubygems_actions
  before_action :set_rubygems, only: set_rubygems_actions

  def index
    @rubygems.each(&:fetch_if_need!)
    @daily_downloads_data = @rubygems.map(&:daily_downloads_data)
  end

  private

  def set_rubygems
    @rubygems = @gemnames.map do |gemname|
      Rubygem.find_or_create_by name: gemname
    end
  end

  def set_gemnames
    @gemnames = params[:query].split("~")
  end
end
