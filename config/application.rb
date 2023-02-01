require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"

Bundler.require(*Rails.groups)

require "./lib/utils"

module Rubytrends
  class Application < Rails::Application
    config.load_defaults 7.0

    config.time_zone = "Tokyo"

    config.i18n.available_locales = %i[en ja]
    config.i18n.default_locale = :en

    config.generators do |g|
      g.template_engine :rails_template

      g.helper false
      g.jbuilder false

      g.routing_specs false
      g.view_specs false
      g.request_specs false
    end

    config.active_job.queue_adapter = :sidekiq
  end
end
