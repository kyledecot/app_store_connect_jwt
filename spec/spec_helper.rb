# frozen_string_literal: true

require 'bundler/setup'
require 'timecop'
require 'simplecov'
require 'pry'

require_relative 'support/fixtures_helper'

SimpleCov.start { add_filter('/spec/') }

require 'app_store_connect/jwt'

RSpec.configure do |config|
  config.include(FixturesHelper)

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.around(:each) do |example|
    Timecop.freeze(Time.parse('2019-01-01 00:00:00 UTC')) do
      example.call
    end
  end
end
