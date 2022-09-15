require "rails/generators/erb/controller/controller_generator"

module RailsTemplate
  module Generators
    class ControllerGenerator < Erb::Generators::ControllerGenerator
      source_root File.expand_path("templates", __dir__)
    end
  end
end
