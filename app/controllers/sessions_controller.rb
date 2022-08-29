class SessionsController < ApplicationController
  skip_before_action :store_user_location!, only: %i[new]
  before_action :authorize_session

  def new; end

  def destroy
    sign_out current_user
    redirect_to root_path
  end

  private

  def authorize_session
    authorize :session
    skip_policy_scope
  end
end
