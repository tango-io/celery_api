module Celery

  class Base
    def initialize(attrs={})
      attrs.each { |key, value| self.send("#{key}=", value) }
    end
  end

end
