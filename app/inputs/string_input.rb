class StringInput < SimpleForm::Inputs::StringInput
  def input_html_classes
    super.push("rounded-md border-gray-200")
  end
end
