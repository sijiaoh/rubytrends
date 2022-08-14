require "./lib/tasks/db_task"

db_task = DbTask.new

namespace :db do
  desc DbTask::START_DESC
  task start: :environment do
    db_task.start
  end

  desc DbTask::STOP_DESC
  task stop: :environment do
    db_task.stop
  end

  desc DbTask::REMOVE_DESC
  task remove: :environment do
    db_task.remove
  end
end
