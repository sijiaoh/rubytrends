module Users
  class SettingsController < ApplicationController
    before_action :set_users_setting, only: %i[show edit update destroy]

    def index
      @users_settings = authorize policy_scope(Users::Setting).page(params[:page])
    end

    def show; end

    def new
      @users_setting = authorize Users::Setting.new
      skip_policy_scope
    end

    def edit; end

    def create
      @users_setting = authorize Users::Setting.new(users_setting_params)
      skip_policy_scope

      if @users_setting.save
        redirect_to @users_setting, notice: notice_message(class_name)
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @users_setting.update(users_setting_params)
        redirect_to @users_setting, notice: notice_message(class_name)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @users_setting.destroy
      redirect_to users_settings_url, notice: notice_message(class_name)
    end

    private

    def set_users_setting
      @users_setting = authorize policy_scope(Users::Setting).find_by!(hashid: params[:hashid])
    end

    def users_setting_params
      params.require(:users_setting).permit(:user_id, :editor_type)
    end
  end
end
