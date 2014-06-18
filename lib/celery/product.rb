module Celery

  class Product < Base

    ENDPOINT_RESOURCE          = "products"
    ENDPOINT_RESOURCE_SINGULAR = "product"

    extend Celery::EndpointMethods

    attr_accessor :id, :_id, :user_id, :slug, :name,
      :image, :price, :deposit, :shipping,
      :quantity, :campaign, :options, :extras, :analytics,
      :billing_notes, :created, :created_date, :css, :description,
      :pitch, :published, :purchase_receipt, :quantity_limit,
      :slug, :tagline, :updated, :updated_date, :video, :flags

    def _id=(id)
      @_id = id
      @id = id
    end

    def update(attrs={})
      update_local_object(attrs)
      endpoint_path     = Celery.endpoint + "products" + "/" + self.id
      options           = Celery.parameterize_options
      response          = HTTParty.put("#{endpoint_path}?#{options}", body: { product: attrs }.to_json, headers: { 'Content-Type' => 'application/json' })

      return true if response['product']
    end

    def update_local_object(attrs)
      attrs.each { |key, value| self.send("#{key}=", value) }
    end

    def destroy
      endpoint_path     = Celery.endpoint + "products" + "/" + self.id
      options           = Celery.parameterize_options
      response          = HTTParty.delete("#{endpoint_path}?#{options}")
      return response['status']
    end
  end

end
