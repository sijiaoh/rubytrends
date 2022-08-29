require "rails_helper"

describe "static pages" do
  describe "home" do
    let(:path) { root_path }

    include_examples "simple visit test"
  end
end
