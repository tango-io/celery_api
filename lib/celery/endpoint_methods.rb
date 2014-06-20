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

    def get(id)
      endpoint_resource = self::ENDPOINT_RESOURCE
      endpoint_path     = Celery.endpoint + endpoint_resource + "/" + id
      options           = Celery.parameterize_options
      response          = HTTParty.get("#{endpoint_path}?#{options}")

      self.new(response[self::ENDPOINT_RESOURCE_SINGULAR])
    end

    def create(attrs={})
      object_root       = self::ENDPOINT_RESOURCE_SINGULAR
      endpoint_resource = self::ENDPOINT_RESOURCE
      endpoint_path     = Celery.endpoint + endpoint_resource
      options           = Celery.parameterize_options
      response          = HTTParty.post("#{endpoint_path}?#{options}", body: { object_root => attrs }.to_json, headers: { 'Content-Type' => 'application/json' })

      self.new(response[self::ENDPOINT_RESOURCE_SINGULAR])
    end
  end

end
