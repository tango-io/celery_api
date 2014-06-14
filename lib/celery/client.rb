module Celery

  class Client
    attr_accessor :access_token

    def initialize(args={})
      @access_token = args[:access_token]
    end

    def orders
      @orders ||= Celery::OrdersProcessor.new(endpoint, access_token)
    end

    def products
      @products ||= Celery::ProductsProcessor.new(endpoint, access_token)
    end

    private
    def endpoint
      @endpoint ||= "https://api.trycelery.com/v1/"
    end
  end

end
