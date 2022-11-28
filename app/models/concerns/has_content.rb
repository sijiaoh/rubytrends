module HasContent
  extend ActiveSupport::Concern

  included do
    before_save :escape_content, if: -> { editor_type == "wysiwyg" }
  end

  private

  def escape_content
    self.content = Loofah.fragment(content).scrub!(:escape).to_s
  end
end
