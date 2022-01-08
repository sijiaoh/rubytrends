require "rails_helper"

RSpec.describe "static pages", type: :system do
  describe "home" do
    let(:path) { root_path }

    include_examples "simple visit test"
  end
end
