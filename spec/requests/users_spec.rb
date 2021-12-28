require "rails_helper"

RSpec.describe "/users", type: :request do
  let(:valid_attributes) do
    { terms_of_service: "1" }
  end

  let(:invalid_attributes) do
    { terms_of_service: "0" }
  end

  describe "GET /index" do
    it "renders a successful response" do
      User.create! valid_attributes
      get users_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      user = User.create! valid_attributes
      get user_url(user)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it { expect { get new_user_url }.to raise_error(StandardError) }
  end

  describe "POST /create" do
    it { expect { post users_url, params: { user: valid_attributes } }.to raise_error(StandardError) }
  end
end
