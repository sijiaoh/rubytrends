module Developments
  class SessionPolicy < ApplicationPolicy
    def create?
      user.blank?
    end
  end
end
