# frozen_string_literal: true

require 'bundler/setup'
require 'vcr'
require 'onesignal'
require 'support/factory_bot'
require 'faker'
require 'dotenv/load'

SPEC_ROOT = __dir__

VCR.configure do |c|
  c.cassette_library_dir = File.join(SPEC_ROOT, '..', 'fixtures', 'vcr_cassettes')
  c.hook_into :webmock
  c.ignore_hosts 'codeclimate.com'
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expose_dsl_globally = true

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
