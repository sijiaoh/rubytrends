require "rails_helper"

RSpec.describe "Posts", type: :system do
  describe "index" do
    let(:path) { posts_path }

    include_examples "simple visit test"
  end

  describe "show" do
    let(:user) { create :user }
    let(:post) { create :post, user: }
    let(:path) { post_path(post) }

    include_examples "simple visit test"
  end

  describe "new" do
    include_context "when signed in"

    let(:path) { new_post_path }

    include_examples "simple visit test"
  end

  describe "edit" do
    include_context "when signed in"

    let(:post) { create :post, user: current_user }
    let(:path) { edit_post_path(post) }

    include_examples "simple visit test"
  end
end
