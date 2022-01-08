class SessionController < ApplicationController
  def new
    authorize :session
    skip_policy_scope
  end

  def destroy
    authorize :session
    skip_policy_scope

    sign_out current_user
    redirect_to root_path
  end
end
