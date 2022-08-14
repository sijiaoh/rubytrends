require "open3"

class DbTask
  def initialize
    @project_name = Rails.application.class.module_parent.name.downcase
    database_config = Rails.configuration.database_configuration[Rails.env]
    @port = database_config["port"]
    @password = database_config["password"]
    @container_name = "#{@project_name}-mysql"
    @version = "8.0"
  end

  START_DESC = "Prepare mysql in docker.".freeze
  def start
    status = docker_command "start #{@container_name}"
    if status[:successed]
      print_to_stdout "#{@container_name} running on #{@port}."
    else
      up
    end
  end

  STOP_DESC = "Remove mysql container.".freeze
  def stop
    status = docker_command "rm -f #{@container_name}"
    if status[:stderr].include? "No such container:"
      print_to_stdout "Container not found."
    else
      print_to_stdout "Removed container."
    end
  end

  REMOVE_DESC = "Remove mysql container and volume.".freeze
  def remove
    stop

    status = docker_command "volume rm #{@container_name}"
    if status[:stderr].include? "No such volume:"
      print_to_stdout "Volume not found."
    else
      print_to_stdout "Removed volume."
    end
  end

  private

  def print_to_stdout(str)
    p str # rubocop:disable Rails/Output
  end

  def raise_if_status_failed(stderr:, successed:)
    raise StandardError, stderr unless successed
  end

  def docker_command(command)
    o, e, s = Open3.capture3("docker #{command}")
    { stdout: o, stderr: e, status: s, successed: s.success? }
  end

  def up
    command = up_command
    status = docker_command(command)
    raise_if_status_failed(**status.slice(:stderr, :successed))

    print_to_stdout "Created #{@container_name} on #{@port}."
  end

  def image_name
    is_arm = RUBY_PLATFORM.start_with? "arm"
    image = is_arm ? "mysql/mysql-server" : "mysql"

    return "#{image}:8.0" if is_arm && @version == "8"

    "#{image}:#{@version}"
  end

  def up_command # rubocop:disable Metrics/MethodLength
    [
      "run",
      "--name #{@container_name}",
      "--env",
      "MYSQL_ROOT_HOST=%",
      "--env",
      "MYSQL_ROOT_PASSWORD=#{@password}",
      "--publish",
      "#{@port}:3306",
      "--volume",
      "#{@container_name}:/var/lib/mysql",
      "-d",
      image_name
    ].join(" ")
  end
end
