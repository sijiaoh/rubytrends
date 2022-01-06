require "rails_helper"

RSpec.describe QueryCount, type: :model do
  describe ".count_query!" do
    subject(:count_query!) { proc { described_class.count_query! query } }

    let(:query) { "c~b~az~aa~ab" }

    it "normalizes query" do
      count_query!.call
      expect(described_class.last.query).to eq "aa~ab~az~b~c"
    end

    context "with first time query" do
      it "creates new record" do
        expect do
          count_query!.call
        end.to change(described_class, :count).by(1)
      end
    end

    context "with exists query" do
      let(:model) { described_class.first }

      before do
        count_query!.call
      end

      it "counts up" do
        expect { count_query!.call }.to change { model.reload.count }.by(1)
      end
    end
  end
end
