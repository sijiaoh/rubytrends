namespace :db do
  id = Rails.application.class.module_parent.name.downcase

  def mysql_in_docker!(command)
    system("bundle exec mysql_in_docker #{command}") || abort("Command failed.")
  end

  task start: :environment do
    database_config = Rails.configuration.database_configuration[Rails.env]
    port = database_config["port"] || 3306
    password = database_config["password"]
    mysql_in_docker! "start #{id} 8 #{port} #{password}"
  end

  task stop: :environment do
    mysql_in_docker! "stop #{id}"
  end

  task remove: :environment do
    mysql_in_docker! "remove #{id}"
  end
end
