module Celery

  module EndpointMethods

    module ClassMethods
      def all(args={})
        response = HTTParty.get("#{endpoint_path}?#{options}")
        return build_collection(response[endpoint_resource])
      end

      def build_collection(collection)
        collection.map { |item| self.new(object_root => item) }
      end

      def get(id)
        response = HTTParty.get("#{endpoint_path}/#{id}?#{options}")
        self.new(response)
      end

      def create(attrs={})
        response = HTTParty.post(
          "#{endpoint_path}?#{options}",
          body:    { object_root => attrs }.to_json,
          headers: { 'Content-Type' => 'application/json' }
        )
        self.new(response)
      end

      def endpoint_path
        Celery.endpoint + endpoint_resource
      end

      def endpoint_resource
        self::ENDPOINT_RESOURCE
      end

      def object_root
        self::ENDPOINT_RESOURCE_SINGULAR
      end

      def options(args={})
        Celery.parameterize_options(args)
      end
    end

    module InstanceMethods
      def update(attrs={})
        update_local_object(attrs)

        response = HTTParty.put(
          "#{self.class.endpoint_path}/#{self.id}?#{self.class.options}",
          body:    { self.class.object_root => attrs }.to_json,
          headers: { 'Content-Type' => 'application/json' }
        )

        return true if response[self.class.object_root]
      end

      def destroy
        response = HTTParty.delete("#{self.class.endpoint_path}/#{self.id}?#{self.class.options}")
        return response['status']
      end

      private
        def update_local_object(attrs)
          attrs.each { |key, value| self.send("#{key}=", value) }
        end
    end
  end

end
