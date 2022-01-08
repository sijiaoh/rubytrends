class ApplicationController < ActionController::Base
  private

  def render_not_found
    render plain: "not_found", status: :not_found
  end
end
