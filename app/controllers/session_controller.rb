class SessionController < ApplicationController
  def new; end

  def destroy
    sign_out current_user
  end
end
