class EditorInput < SimpleForm::Inputs::Base
  def input
    input_type = case options[:editor_type].to_sym
                 when :wysiwyg
                   :wysiwyg
                 when :markdown
                   :code_editor
                 else
                   :text
                 end
    @builder.input attribute_name, **options, label: false, as: input_type
  end

  private

  def helpers
    ApplicationController.helpers
  end
end
