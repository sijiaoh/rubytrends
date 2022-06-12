# == Schema Information
#
# Table name: social_profiles
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  provider   :integer          not null
#  uid        :string(255)      not null
#  email      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SocialProfile < ApplicationRecord
  belongs_to :user

  enum provider: { google_oauth2: 0 }
end
