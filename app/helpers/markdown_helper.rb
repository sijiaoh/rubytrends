module MarkdownHelper
  def markdown_viewer(content, **options)
    content_tag(
      :div,
      nil,
      "data-controller": "markdown-viewer",
      "data-markdown-viewer-content-value": content,
      **options,
      class: class_names("overflow-auto", options[:class])
    ) do
      content_tag :div, nil, "data-markdown-viewer-target": "content", class: content_class
    end
  end
end
