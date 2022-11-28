require "rails_helper"

RSpec.describe ChartView do
  subject(:chart_view) { described_class.new raw_query: }

  let(:raw_query) { "B_c~a" }

  describe "#query" do
    it "returns downcase raw_query" do
      expect(chart_view.query).to eq raw_query.downcase
    end
  end

  describe "#gemnames" do
    it "returns an array split by ~" do
      expect(chart_view.gemnames).to eq raw_query.downcase.split("~")
    end

    context "with contains duplicate query" do
      let(:raw_query) { "B_c~a~a" }

      it "returns an array that not contains duplicate item" do
        expect(chart_view.gemnames).to eq raw_query.downcase.split("~").uniq
      end
    end
  end

  describe "#prepare_rubygems!" do
    context "with legal query" do
      it "creates rubygems" do
        expect do
          chart_view.prepare_rubygems!
        end.to change(Rubygem, :count).by(raw_query.split("~").length)
      end

      it "sets rubygems to #rubygems" do
        expect do
          chart_view.prepare_rubygems!
        end.to change { chart_view.rubygems&.count || 0 }.by(raw_query.split("~").length)
      end
    end

    context "with illegal query" do
      let(:raw_query) { "a.b" }

      it "raises error when failed to create rubygems" do
        expect { chart_view.prepare_rubygems! }.to raise_error StandardError
      end
    end
  end
end
