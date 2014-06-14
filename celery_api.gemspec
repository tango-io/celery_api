$:.push File.expand_path("../lib", __FILE__)
require "celery/version"
Gem::Specification.new do |s|
  s.name        = "celery_api"
  s.version     = Celery::VERSION
  s.authors     = ["Antonio Chavez"]
  s.email       = ["cavjzz@gmail.com"]
  s.homepage    = "https://github.com/TheNaoX/celery_api"
  s.summary     = "Celery API wrapper"
  s.description = "This is an Ruby library that wraps the Celery data model"
  s.licenses    = "MIT"

  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "httparty"
  s.add_dependency "addressable"

  # Rspec testing framework
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-core"
  s.add_development_dependency "rspec-expectations"
  s.add_development_dependency "rspec-mocks"
  s.add_development_dependency "faker"
  s.add_development_dependency "pry"
end
