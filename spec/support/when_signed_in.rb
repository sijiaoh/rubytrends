shared_context "when signed in" do
  let(:current_user) { create(:user) }

  before do
    sign_in current_user
  end
end
