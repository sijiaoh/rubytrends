require "rails_helper"

RSpec.describe "home", type: :system do
  describe "GET /" do
    it "renders correctly" do
      visit root_path
      expect(page).to have_current_path root_path
    end
  end
end
