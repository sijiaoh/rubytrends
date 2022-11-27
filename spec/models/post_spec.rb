# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  title       :string(255)      not null
#  content     :text(65535)      not null
#  published   :boolean          default(FALSE), not null
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  hashid      :string(255)
#  editor_type :integer          default("textarea"), not null
#
require "rails_helper"

describe Post do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_editor_type_enum }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end

  context "when create" do
    subject(:post) { create(:post, user:) }

    let(:editor_type) { described_class.editor_type.values.sample }
    let(:user) do
      create(:user).tap do |user|
        user.setting.update!(editor_type:)
      end
    end

    it "sets editor_type from user's setting" do
      expect(post.editor_type).to eq(editor_type)
    end
  end

  include_examples "has content concern"
end
