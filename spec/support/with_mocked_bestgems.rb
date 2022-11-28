shared_context "with mocked Rubygem#fetch_resource_data" do
  include_context "with fake resource data"

  let(:rubygem) { create(:rubygem) }

  before do
    allow(Rubygem).to receive(:new).and_return(rubygem)
    allow(rubygem).to receive(:fetch_source_data).and_return(source_data)
  end
end
