class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def access_denied!
    render_forbidden
  end

  def render_forbidden
    render plain: "forbidden", status: :forbidden
  end

  def render_not_found
    render plain: "not_found", status: :not_found
  end
end
