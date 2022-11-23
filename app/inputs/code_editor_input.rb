class CodeEditorInput < SimpleForm::Inputs::Base
  def input
    return @builder.text_area(attribute_name) if Rails.env.test?

    helpers.content_tag(
      :div,
      "data-controller": "code-editor",
      **input_html_options,
      class: helpers.class_names("flex", input_html_options[:class])
    ) do
      @builder.text_area(attribute_name, hidden: true)
    end
  end

  private

  def helpers
    ApplicationController.helpers
  end
end
