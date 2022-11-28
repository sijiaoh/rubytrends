module ContentViewerHelper
  def content_viewer(content, editor_type:)
    case editor_type.to_sym
    when :wysiwyg
      wysiwyg_viewer content
    when :markdown
      markdown_viewer content
    else
      content_tag :div, content
    end
  end
end
