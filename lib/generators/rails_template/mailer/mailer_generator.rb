require "rails/generators/erb/mailer/mailer_generator"

module RailsTemplate
  module Generators
    class MailerGenerator < Erb::Generators::MailerGenerator
      source_root File.expand_path("templates", __dir__)
    end
  end
end
