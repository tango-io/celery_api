module Celery

  class Products < Base
    class << self
      def all(args={})
        endpoint_path = Celery.endpoint + "products"
        options       = Celery.parameterize_options(args)
        response = HTTParty.get("#{endpoint_path}?#{options}")
        return build_products(response['products'])
      end

      def build_products(products)
        products.map { |product| Celery::Product.new(product) }
      end
    end
  end

end
