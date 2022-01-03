class CompareController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_rubygems, only: :index

  def index
    @rubygems.each(&:fetch_if_need!)
  end

  private

  def set_rubygems
    @rubygems = gemnames.map do |gemname|
      Rubygem.find_or_create_by name: gemname
    end
  end

  def gemnames
    params[:query].split("~")
  end
end
