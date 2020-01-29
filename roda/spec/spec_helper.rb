# Require this file for unit tests
ENV['APP_ENV'] ||= 'test'

require_relative '../config/environment'
require 'rspec'
require 'database_cleaner'

require_relative 'support/controller_authentication_helpers'

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.before { DatabaseCleaner.clean }

  config.before(:all) { Git.test = true }

  config.around(integration: true) do |example|
    Git.test = false
    example.run
    Git.test = true
  end

  config.include ControllerAuthenticationHelpers, uses_authentication: true
end
