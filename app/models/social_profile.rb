class SocialProfile < ApplicationRecord
  belongs_to :user

  enum provider: { google_oauth2: 0 }
end
