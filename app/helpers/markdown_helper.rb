module MarkdownHelper
  def markdown_viewer(content)
    content_tag(
      :div,
      nil,
      "data-controller": "markdown-viewer",
      "data-markdown-viewer-content-value": content,
      class: "markdown-viewer"
    )
  end
end
