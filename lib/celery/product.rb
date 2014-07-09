module Celery

  class Product < Base

    ENDPOINT_RESOURCE          = "products"
    ENDPOINT_RESOURCE_SINGULAR = "product"

    extend Celery::EndpointMethods::ClassMethods
    include Celery::EndpointMethods::InstanceMethods

    attr_accessor :id, :_id, :user_id, :slug, :name,
      :image, :price, :deposit, :shipping,
      :quantity, :campaign, :options, :extras, :analytics,
      :billing_notes, :created, :created_date, :css, :description,
      :pitch, :published, :purchase_receipt, :quantity_limit,
      :slug, :tagline, :updated, :updated_date, :video, :flags

    def initialize(response={})
      attrs = response[self.class.object_root]
      attrs.each { |key, value| self.send("#{key}=", value) }
    rescue Exception => e
      raise Celery::Error.new(attrs)
    end

    def _id=(id)
      @_id = id
      @id = id
    end
  end

end
