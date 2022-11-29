require "./lib/tasks/db_task"
require "./lib/tasks/redis_task"

db_task = DbTask.new
redis_task = RedisTask.new

namespace :backends do
  desc "Prepare backends in docker."
  task start: :environment do
    db_task.start
    redis_task.start
  end

  task "Remove backend containers but without volumes."
  task stop: :environment do
    db_task.stop
    redis_task.stop
  end

  task "Remove backend containers and volumes."
  task remove: :environment do
    db_task.remove
    redis_task.remove
  end
end
