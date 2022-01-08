module Users
  class OmniauthCallbacksPolicy < ApplicationPolicy
    def google_oauth2?
      user.blank?
    end
  end
end
