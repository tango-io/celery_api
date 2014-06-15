require "codeclimate-test-reporter"
require 'celery_api'
require 'faker'
require 'pry'

CodeClimate::TestReporter.start

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

I18n.enforce_available_locales = true

RSpec.configure do |config|
  config.include CeleryOrderHelper
end
