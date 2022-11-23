# == Schema Information
#
# Table name: users_settings
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  editor_type :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
module Users
  class Setting < ApplicationRecord
    include EditorTypeEnum

    belongs_to :user
    validates :user_id, uniqueness: true
  end
end
