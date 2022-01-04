class SessionController < ApplicationController
  def new; end

  def destroy
    sign_out current_user
    redirect_to root_path
  end
end
