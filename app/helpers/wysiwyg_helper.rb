module WysiwygHelper
  def wysiwyg_class
    # Use wysiwyg_style instead of wysiwyg, because wysiwyg is already used in WysiwygInput.
    "wysiwyg_style prose"
  end

  def prism_theme_css
    "https://cdnjs.cloudflare.com/ajax/libs/prism-themes/1.9.0/prism-dracula.min.css"
  end

  def wysiwyg_viewer(content)
    content_tag :div, content.html_safe, "data-controller": "wysiwyg-viewer", class: wysiwyg_class # rubocop:disable Rails/OutputSafety
  end
end
