require "rails_helper"

describe "User setting." do
  include_context "when signed in"

  describe "GET /users/setting" do
    subject(:path) { user_setting_path(current_user) }

    include_examples "simple visit test"
  end

  describe "PATCH /users/setting" do
    subject(:path) { edit_user_setting_path(current_user) }

    it "updates user setting" do
      visit path

      select Users::Setting.editor_type.wysiwyg.text,
             from: Users::Setting.human_attribute_name(:editor_type)

      should_change_current_path do
        click_on I18n.t("helpers.submit.update")
      end

      expect(current_user.setting.reload.editor_type).to eq :wysiwyg
    end
  end
end
