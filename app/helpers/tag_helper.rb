module TagHelper
  def h1(text, options = {})
    title text if options[:title] != false
    klass = class_names "font-bold text-4xl", options[:class]
    content_tag(:h1, text, **options, class: klass)
  end
end
