module ApplicationHelper
  def ga_measurement_id
    Utils.env_or_credential "ga_measurement_id", ""
  end

  def svg(path, options = {})
    content_tag :div, class: options[:class] do
      Rails.root.join("app", "assets", "images", path).read.html_safe # rubocop:disable Rails/OutputSafety
    end
  end
end
