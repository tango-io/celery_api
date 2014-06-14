module Celery

  class ProductsProcessor < ProcessorBase
    def initialize(endpoint=nil, access_token=nil)
      super
      @endpoint_path = endpoint + "products" if endpoint
    end

    def all(args={})
      response = HTTParty.get("#{endpoint_path}?#{parameterize_options(args)}")
      @orders = Celery::Products.new(response)
    end
  end

end
