class CustomFormBuilder < SimpleForm::FormBuilder
  def text_field(*args, &)
    options = args.extract_options!
    klass = @template.class_names "rounded-md border-gray-200", options[:class]
    super(*args, **options, class: klass, &)
  end

  def check_box(*args, &)
    option_index = 1

    option = args[option_index]
    klass = @template.class_names "rounded border-gray-200", option[:class]

    args = args.dup
    args[option_index] = option.merge(class: klass)

    super(*args, &)
  end
end
