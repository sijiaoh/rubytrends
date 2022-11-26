class ContentEditorInput < SimpleForm::Inputs::Base
  def input(_wrapper_options)
    input_type = case options[:editor_type].to_sym
                 when :wysiwyg
                   :wysiwyg
                 when :markdown
                   :markdown
                 else
                   :text
                 end
    @builder.input attribute_name, **options, label: false, wrapper: false, as: input_type
  end

  private

  def helpers
    ApplicationController.helpers
  end
end
