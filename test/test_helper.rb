ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Add more helper methods to be used by all tests here...
  include FactoryBot::Syntax::Methods

  OmniAuth.config.test_mode = true
  google = Faker::Omniauth.unique.google
  OmniAuth.config.add_mock(google[:provider], google)
end
