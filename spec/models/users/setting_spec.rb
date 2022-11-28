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
require "rails_helper"

describe Users::Setting do
  subject(:setting) { create(:user).setting }

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_uniqueness_of(:user_id) }
  end

  describe "enums" do
    it { is_expected.to have_editor_type_enum }
  end
end
