RSpec::Matchers.define :have_editor_type_enum do
  match do |actual|
    expect(actual).to enumerize(:editor_type).in(textarea: 0, wysiwyg: 1, markdown: 2).with_default(:textarea)
  end
end
