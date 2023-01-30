module WysiwygHelper
  def wysiwyg_viewer(content)
    content_tag :div, content.html_safe, "data-controller": "wysiwyg-viewer", class: content_class # rubocop:disable Rails/OutputSafety
  end
end
