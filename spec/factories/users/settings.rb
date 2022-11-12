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
FactoryBot.define do
  factory :users_setting, class: "Users::Setting" do
    user { nil }
    editor_type { 1 }
  end
end
