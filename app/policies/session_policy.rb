class SessionPolicy < ApplicationPolicy
  def new?
    user.blank?
  end

  def destroy?
    user.present?
  end
end
