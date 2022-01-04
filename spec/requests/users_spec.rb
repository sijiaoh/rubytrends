require "rails_helper"

RSpec.describe "/users", type: :request do
  before { skip }

  let(:valid_attributes) do
    { terms_of_service: "1" }
  end

  describe "GET /new" do
    it { expect { get new_user_url }.to raise_error(StandardError) }
  end

  describe "POST /create" do
    it { expect { post users_url, params: { user: valid_attributes } }.to raise_error(StandardError) }
  end
end
