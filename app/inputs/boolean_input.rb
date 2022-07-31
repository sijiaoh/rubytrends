class BooleanInput < SimpleForm::Inputs::BooleanInput
  def input_html_classes
    super.push("rounded border-gray-200")
  end
end
