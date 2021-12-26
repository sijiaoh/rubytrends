class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :social_profiles, dependent: :destroy

  def self.from_omniauth(access_token)
    data = access_token.info
    User.where(email: data["email"]).first
  end
end
