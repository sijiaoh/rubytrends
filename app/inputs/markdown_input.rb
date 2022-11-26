class MarkdownInput < SimpleForm::Inputs::Base
  def input(_wrapper_options) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    return @builder.text_area(attribute_name) if Rails.env.test?

    helpers.content_tag(
      :div,
      "data-controller": "markdown-editor",
      "data-action": "code-editor:update->markdown-editor#updateViewerContent",
      **input_html_options,
      class: helpers.class_names("flex", input_html_options[:class])
    ) do
      [
        @builder.input(attribute_name, as: :code_editor, label: false, wrapper: false, input_html: { class: "w-1/2" }),
        helpers.markdown_viewer(object[attribute_name], class: "w-1/2")
      ].sum
    end
  end

  private

  def helpers
    ApplicationController.helpers
  end
end
