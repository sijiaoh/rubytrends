class WysiwygInput < SimpleForm::Inputs::Base
  def input # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    return @builder.text_area(attribute_name) if Rails.env.test?

    helpers.content_tag(
      :div,
      "data-controller": "wysiwyg",
      "data-wysiwyg-id-value": generate_id,
      "data-wysiwyg-body-class-value": helpers.wysiwyg_class,
      "data-action": "turbo:before-cache@document->wysiwyg#unmount",
      "data-wysiwyg-content-css-value": [
        helpers.asset_path("tailwind.css"),
        helpers.asset_path("wysiwyg.css"),
        helpers.prism_theme_css
      ].to_json,
      **input_html_options
    ) do
      @builder.text_area(attribute_name, hidden: true)
    end
  end

  private

  def generate_id
    SecureRandom.uuid
  end

  def helpers
    ApplicationController.helpers
  end
end
