# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string(255)      not null
#  content    :text(65535)      not null
#  published  :boolean          default(FALSE), not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  hashid     :string(255)
#
require "rails_helper"

describe Post do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end

  it "escapes content before save" do
    content = "<script>alert('hi');</script>"
    post = create(:post, { user: create(:user), content: })
    expect(post.content).to eq "&lt;script&gt;alert('hi');&lt;/script&gt;"
  end
end
