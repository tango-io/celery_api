$:.push File.expand_path("../lib", __FILE__)
require "celery/version"
Gem::Specification.new do |s|
  s.name        = "celery_api"
  s.version     = Celery::VERSION
  s.authors     = ["Antonio Chavez"]
  s.email       = ["cavjzz@gmail.com"]
  s.homepage    = "https://github.com/tangosource/celery_api"
  s.summary     = "Celery API wrapper"
  s.description = "This is an Ruby library that wraps the Celery data model"
  s.licenses    = "MIT"

  s.required_ruby_version = '~> 2.0'

  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "httparty",    "~> 0.13"
  s.add_dependency "addressable", "~> 2.3"

  # Rspec testing framework
  s.add_development_dependency "pry",                       "~> 0.10"
  s.add_development_dependency "faker",                     "~> 1.3"
  s.add_development_dependency "rspec",                     "~> 3"
  s.add_development_dependency "guard",                     "~> 2.6"
  s.add_development_dependency "rspec-core",                "~> 3"
  s.add_development_dependency "guard-rspec",               "~> 4.2"
  s.add_development_dependency "rspec-mocks",               "~> 3"
  s.add_development_dependency "rspec-expectations",        "~> 3"
  s.add_development_dependency "codeclimate-test-reporter", "~> 0.3"
end
