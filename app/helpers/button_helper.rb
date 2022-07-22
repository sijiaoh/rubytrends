module ButtonHelper
  def button_base_style
    "block w-fit font-medium py-2 px-4 rounded"
  end

  %i[base primary secondary danger].each do |color|
    unless color == :base
      define_method "button_#{color}_style" do
        class_names button_base_style, "text-white bg-#{color}-500 hover:bg-#{color}-600"
      end
    end

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
