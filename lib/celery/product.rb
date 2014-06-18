module Celery

  class Product < Base
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
