class CompareController < ApplicationController
  include RubygemSetters

  skip_before_action :authenticate_user!
  before_action :set_rubygems, only: :index
  before_action :set_query, only: :index

  def index
    @rubygems.each(&:fetch_if_need!)
    QueryCount.count_query @query
  end

  private

  def set_query
    @query = @gemnames.join("~")
  end
end
