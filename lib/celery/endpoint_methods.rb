module Celery

  module EndpointMethods
    def all(args={})
      endpoint_resource = self::ENDPOINT_RESOURCE
      endpoint_path     = Celery.endpoint + endpoint_resource
      options           = Celery.parameterize_options(args)
      response          = HTTParty.get("#{endpoint_path}?#{options}")

      return build_collection(response[endpoint_resource])
    end

    def build_collection(collection)
      collection.map { |item| self.new(item) }
    end
  end

end
