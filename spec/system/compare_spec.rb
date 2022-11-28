require "rails_helper"

RSpec.describe "compare" do
  include_context "with mocked Rubygem#fetch_resource_data"

  describe "GET /compare/:query" do
    it "renders correctly" do
      visit compare_path("mysql_in_docker")
      expect(find("#chart canvas")).to be_truthy
    end
  end
end
