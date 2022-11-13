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
    it { is_expected.to define_enum_for(:editor_type).with_values(textarea: 0, wysiwyg: 1, markdown: 2) }
  end
end
