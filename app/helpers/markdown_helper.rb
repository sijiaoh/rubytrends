module MarkdownHelper
  def markdown_viewer(content, **options)
    content_tag(
      :div,
      nil,
      "data-controller": "markdown-viewer",
      "data-markdown-viewer-content-value": content,
      **options,
      class: class_names("markdown-viewer", content_class, options[:class])
    )
  end
end
