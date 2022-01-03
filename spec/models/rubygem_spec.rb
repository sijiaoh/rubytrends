require "rails_helper"

RSpec.describe Rubygem, type: :model do
  let(:rubygem) { create :rubygem }

  include_context "with fake resource data"

  describe "#fetch_if_need!" do
    context "without exists data" do
      before do
        allow(rubygem).to receive(:fetch_source_data).and_return(source_data)
      end

      it "creates all daily summaries" do
        expect do
          rubygem.fetch_if_need!
        end.to change(DailySummary, :count).by(source_data.length)
      end
    end

    context "with exists data" do
      let(:new_data_count) { 5 }

      before do
        allow(rubygem).to receive(:fetch_source_data).and_return(source_data[new_data_count..])
        rubygem.fetch_if_need!
        rubygem.last_fetch_date = nil
        rubygem.save!
        allow(rubygem).to receive(:fetch_source_data).and_return(source_data)
      end

      it "creates all daily summaries" do
        expect do
          rubygem.fetch_if_need!
        end.to change(DailySummary, :count).by(new_data_count)
      end
    end
  end
end
