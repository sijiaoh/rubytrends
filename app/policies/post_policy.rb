class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    user.is_admin? || user == record.user
  end

  def destroy?
    user.is_admin? || user == record.user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
