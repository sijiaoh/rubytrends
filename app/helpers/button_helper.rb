module ButtonHelper
  def button_base_style
    "block w-fit font-medium py-2 px-4 rounded"
  end

  def button_primary_style
    class_names button_base_style, "text-white bg-primary-500 hover:bg-primary-600"
  end

  def button_secondary_style
    class_names button_base_style, "text-white bg-secondary-500 hover:bg-secondary-600"
  end

  def button_danger_style
    class_names button_base_style, "text-white bg-danger-500 hover:bg-danger-600"
  end

  %i[base primary secondary danger].each do |color|
    define_method "button_#{color}" do |*args, **options, &block|
      klass = class_names public_send("button_#{color}_style"), options[:class]
      button_or_link_to(*args, **options, class: klass, &block)
    end

    define_method "link_#{color}" do |*args, **options, &block|
      public_send("button_#{color}", *args, **options, type: :link, &block)
    end
  end

  private

  def button_or_link_to(*args, **options, &)
    return link_to(*args, **options, &) if options[:type] == :link

    button_to(*args, **options, &)
  end
end
