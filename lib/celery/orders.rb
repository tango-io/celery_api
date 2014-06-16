module Celery

  class Orders < Base

    class << self
      def all(args={})
        endpoint_path = Celery.endpoint + "orders"
        options       = Celery.parameterize_options(args)
        response = HTTParty.get("#{endpoint_path}?#{options}")
        return build_orders(response['orders'])
      end

      def build_orders(orders)
        orders.map do |order|
          Celery::Order.new(order)
        end
      end

      def decode_order(encoded_string)
        decoded_string = Base64.decode64(encoded_string)
        Celery::Order.new(JSON.parse(decoded_string))
      end
    end

  end

end
