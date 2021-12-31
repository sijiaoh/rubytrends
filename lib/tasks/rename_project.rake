task :rename_project, [:name] => :environment do |_task, args|
  current_name = Rails.application.class.module_parent_name
  new_name = args[:name]

  replace = proc do |method|
    paths = `git grep --files-with-matches #{current_name.send(method)}`.split("\n")
    paths.each do |path|
      next if File.basename(path) == "README.md"

      file = File.read path
      file.gsub! current_name.send(method), new_name.send(method)
      File.write path, file
    end
  end

  replace.call :camelize
  replace.call :underscore
end
