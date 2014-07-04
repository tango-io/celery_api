module Celery

  class Shop < Base
    attr_accessor :_id, :analytics, :notes, :campaign, :created,
      :created_date, :css, :deposit, :description, :extras, :flags,
      :image, :metadata, :name, :options, :pitch, :price, :published,
      :quantity_limit, :shipping, :slug, :tagline, :updated, :updated_date,
      :user_id, :video

    class << self
      def get(slug)
        response = HTTParty.get("#{endpoint_path}/#{slug}")
        Celery::Product.new(response["product"])
      end

      def slugify(slug)
        response = HTTParty.get("#{Celery.endpoint}slugify?slug=#{slug}")
        return response["slugify"]
      end

      def endpoint_path
        Celery.endpoint + "shop"
      end

      def options(args={})
        Celery.parameterize_options(args)
      end
    end
  end

end
