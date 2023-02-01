require "./lib/tasks/backend_task"

class RedisTask < BackendTask
  def initialize
    super(
      image: "redis",
      version: "7",
      port: "6379",
    )
  end
end
