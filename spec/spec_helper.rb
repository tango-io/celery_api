require "codeclimate-test-reporter"
require 'celery_api'
require 'faker'
require 'pry'

CodeClimate::TestReporter.start

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

Celery.access_token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI1M2M2OTY3MjIzN2RkMTA3MDBiYjY1YWYifQ.CbBFs_TdCfiVXmsEwVS5_mU47Un3j4NnVxHm_3Scp24'

I18n.enforce_available_locales = true

RSpec.configure do |config|
  config.include CeleryOrderHelper
end
