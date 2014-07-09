module Celery

  class Base
    def initialize(attrs={})
      attrs.each { |key, value| self.send("#{key}=", value) }
    rescue Exception => e
      raise Celery::Error.new(attrs)
    end
  end

  class Celery::Error < StandardError; end
end
