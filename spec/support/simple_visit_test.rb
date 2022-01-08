shared_examples "simple visit test" do
  it "is status ok" do
    visit path
    expect(page).to have_current_path path
  end
end
