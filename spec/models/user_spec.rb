require "rails_helper"

RSpec.describe User, type: :model do
  describe "#terms_of_service" do
    subject(:user) { build :user }

    context "when checked" do
      it "creates user" do
        user.terms_of_service = "1"
        expect { user.save! }.to change(described_class, :count).by(1)
      end
    end

    context "when unchecked" do
      it "faileds" do
        user.terms_of_service = "0"
        expect { user.save }.to change(described_class, :count).by(0)
      end
    end
  end

  describe ".create_with_social_profile" do
    subject(:user) { described_class.create_with_social_profile({ terms_of_service: "1" }, omniauth_data) }

    let(:omniauth_data) { Faker::Omniauth.google.with_indifferent_access }

    it "creates user and social_profile" do
      expect { user.save! }
        .to change(described_class, :count).by(1).and change(SocialProfile, :count).by(1)
    end
  end
end
