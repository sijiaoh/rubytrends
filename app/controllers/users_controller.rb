class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  before_action :set_omniauth_data, only: %i[new create]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.build_with_social_profile(user_params, @omniauth_data)

    if @user.save
      redirect_to user_url(@user), notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:terms_of_service)
  end

  def set_omniauth_data
    omniauth_data = session["devise.omniauth_data"]
    raise "devise.omniauth_data not found." unless omniauth_data

    @omniauth_data = omniauth_data
  end
end
