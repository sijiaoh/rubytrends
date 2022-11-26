module MarkdownHelper
  def markdown_viewer(content, **options)
    content_tag(
      :div,
      nil,
      "data-controller": "markdown-viewer",
      "data-markdown-viewer-content-value": content,
      class: class_names("markdown-viewer", options[:class])
    )
  end
end
