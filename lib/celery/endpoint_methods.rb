module Celery

  module EndpointMethods

    module ClassMethods
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

    module InstanceMethods
      def update(attrs={})
        update_local_object(attrs)
        endpoint_path     = Celery.endpoint + endpoint_resource + "/" + self.id
        options           = Celery.parameterize_options
        response          = HTTParty.put("#{endpoint_path}?#{options}", body: { object_root => attrs }.to_json, headers: { 'Content-Type' => 'application/json' })

        return true if response[object_root]
      end

      private
        def update_local_object(attrs)
          attrs.each { |key, value| self.send("#{key}=", value) }
        end

        def object_root
          @object_root ||= self.class::ENDPOINT_RESOURCE_SINGULAR
        end

        def endpoint_resource
          @endpoint_resource ||= self.class::ENDPOINT_RESOURCE
        end
    end
  end

end
