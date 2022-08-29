# == Schema Information
#
# Table name: rubygems
#
#  id              :bigint           not null, primary key
#  name            :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  last_fetch_date :date
#
require "rails_helper"

RSpec.describe Rubygem, type: :model do
  let(:rubygem) { create :rubygem }

  include_context "with fake resource data"

  describe "#name" do
    context "with correct name" do
      let(:name) { "a-b_c-0_9" }

      it "creates record" do
        expect do
          create :rubygem, name:
        end.to change(described_class, :count).by 1
      end
    end
  end

  describe "#fetch_if_need!" do
    context "without exists data" do
      include_context "with mocked Rubygem#fetch_resource_data"

      it "creates all daily summaries" do
        expect do
          rubygem.fetch_if_need!
        end.to change(DailySummary, :count).by(source_data.length)
      end
    end

    context "with exists data" do
      before do
        allow(rubygem).to receive(:fetch_source_data).and_return(source_data[new_data_count..])
        rubygem.fetch_if_need!
        rubygem.last_fetch_date = nil
        rubygem.save!
        allow(rubygem).to receive(:fetch_source_data).and_return(source_data)
      end

      context "with 5 records" do # rubocop:disable RSpec/NestedGroups
        let(:new_data_count) { 5 }

        it "creates all daily summaries" do
          expect do
            rubygem.fetch_if_need!
          end.to change(DailySummary, :count).by(new_data_count)
        end
      end

      context "with a record" do # rubocop:disable RSpec/NestedGroups
        let(:new_data_count) { 1 }

        it "calculates daily_download correctly" do
          rubygem.fetch_if_need!
          daily_summaries = DailySummary.order(date: :desc).limit(2)
          first = daily_summaries.first
          second = daily_summaries.second
          expect(first.daily_downloads).to eq(first.total_downloads - second.total_downloads)
        end
      end
    end
  end
end
