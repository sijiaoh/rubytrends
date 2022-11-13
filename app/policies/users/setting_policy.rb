module Users
  class SettingPolicy < ApplicationPolicy
    def show?
      user&.is_admin? || user == record.user
    end

    def update?
      user&.is_admin? || user == record.user
    end
  end
end
