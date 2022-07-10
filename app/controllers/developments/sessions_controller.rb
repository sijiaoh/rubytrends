module Developments
  class SessionsController < ApplicationController
    def create
      authorize %i[developments session]
      skip_policy_scope

      raise unless Rails.env.development?

      user = User.first || User.create
      sign_in_and_redirect user, event: :authentication
    end
  end
end
