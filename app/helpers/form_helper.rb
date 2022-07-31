module FormHelper
  def custom_form_for(*args, &)
    options = args.extract_options!
    simple_form_for(*args, **options, builder: CustomFormBuilder, &)
  end
end
