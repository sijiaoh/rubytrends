require "rails_helper"

RSpec.describe DailySummary, type: :model do
  describe ".build_from_source_data" do
    let(:rubygem) { create :rubygem }

    include_context "with fake resource data"

    context "without exists data" do
      it "returns full records" do
        daily_summaries = described_class.build_from_source_data source_data, nil, rubygem
        expect do
          described_class.import! daily_summaries
        end.to change(described_class, :count).by(source_data.length)
      end
    end

    context "with exists data" do
      let(:new_data_count) { 5 }
      let(:last_exists_summary) { described_class.order(:date).last }

      before do
        exists_summaries = described_class.build_from_source_data source_data[new_data_count..], nil, rubygem
        described_class.import! exists_summaries
      end

      it "returns missing records" do # rubocop:disable RSpec/MultipleExpectations
        daily_summaries = described_class.build_from_source_data source_data, last_exists_summary, rubygem
        expect do
          described_class.import! daily_summaries
        end.to change(described_class, :count).by(new_data_count)
        expect(described_class.count).to eq source_data.length
      end
    end
  end
end
