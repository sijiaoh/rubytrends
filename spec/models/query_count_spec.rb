require "rails_helper"

RSpec.describe QueryCount, type: :model do
  describe ".count_query" do
    let(:query) { "a~b_c" }

    context "with first time query" do
      it "creates new record" do
        expect do
          described_class.count_query query
        end.to change(described_class, :count).by(1)
      end
    end

    context "with exists query" do
      let(:model) { described_class.find_by query: query }

      before do
        described_class.count_query query
      end

      it "counts up" do
        expect do
          described_class.count_query query
        end.to change { model.reload.count }.by(1)
      end
    end
  end
end
