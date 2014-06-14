require 'base64'

module Celery

  class OrdersProcessor < ProcessorBase
    def initialize(endpoint=nil, access_token=nil)
      super
      @endpoint_path = endpoint + "orders" if endpoint
    end

    def all(args={})
      response = HTTParty.get("#{endpoint_path}?#{parameterize_options(args)}")
      @orders = Celery::Orders.new(response)
    end

    def decode_order(encoded_string)
      decoded_string = Base64.decode64(encoded_string)
      Celery::Order.new(JSON.parse(decoded_string))
    end
  end

end
