class UserPolicy < ApplicationPolicy
  def index?
    false
  end

  def show?
    user == record
  end

  def create?
    user.blank?
  end

  class Scope < Scope
    def resolve
      scope.where(id: user.id)
    end
  end
end
