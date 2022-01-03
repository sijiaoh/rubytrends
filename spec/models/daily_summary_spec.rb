require "rails_helper"

RSpec.describe DailySummary, type: :model do
  describe ".build_from_source_data" do
    let(:rubygem) { create :rubygem }

    include_context "with fake resource data"

    context "without exists data" do
      let(:daily_summaries) { described_class.build_from_source_data source_data, nil, rubygem }

      it "returns full records" do
        expect do
          described_class.import! daily_summaries
        end.to change(described_class, :count).by(source_data.length)
      end

      def calc_daily_downloads(daily_summaries, index)
        daily_summary = daily_summaries[index]
        if index > 0
          daily_summary.total_downloads - daily_summaries[index - 1].total_downloads
        else
          0
        end
      end

      it "correctlies calculate daily_downloads" do
        daily_summaries.each.with_index do |daily_summary, index|
          expect(daily_summary.daily_downloads).to eq calc_daily_downloads(daily_summaries, index)
        end
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
