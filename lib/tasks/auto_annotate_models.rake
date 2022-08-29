if Rails.env.development?
  require "annotate"

  task set_annotation_options: :environment do
    Annotate.set_defaults models: true
  end

  Annotate.load_tasks
end
