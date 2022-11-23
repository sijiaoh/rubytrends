module EditorTypeEnum
  extend ActiveSupport::Concern

  included do
    extend Enumerize
    enumerize :editor_type, in: { textarea: 0, wysiwyg: 1, markdown: 2 }, default: :textarea
  end
end
