require "codeclimate-test-reporter"
require 'celery_api'
require 'faker'
require 'pry'

CodeClimate::TestReporter.start

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

Celery.access_token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI1Mzg4ZTcxYzVkNTE5NDA1MDA0ZTNjM2MifQ.Vw1dikATVaAK5YLZFTPOXKpJJexa8T6Ni1RuE3nh1nAU"

I18n.enforce_available_locales = true

RSpec.configure do |config|
  config.include CeleryOrderHelper
end
