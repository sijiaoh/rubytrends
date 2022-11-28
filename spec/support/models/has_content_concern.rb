shared_examples "has content concern" do
  describe "content escaping" do
    let(:content) { "<script>alert('hi');</script>" }
    let(:post) { create(:post, user: create(:user), content:, editor_type:) }

    context "when editor_type is textarea" do
      let(:editor_type) { :textarea }

      it "does not escape content before save" do
        expect(post.content).to eq content
      end
    end

    context "when editor_type is wysiwyg" do
      let(:editor_type) { :wysiwyg }

      it "escapes content before save" do
        expect(post.content).to eq "&lt;script&gt;alert('hi');&lt;/script&gt;"
      end
    end

    context "when editor_type is markdown" do
      let(:editor_type) { :markdown }

      it "does not escape content before save" do
        expect(post.content).to eq content
      end
    end
  end
end
