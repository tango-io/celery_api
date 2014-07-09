module Celery

  class Order < Base

    ENDPOINT_RESOURCE          = "orders"
    ENDPOINT_RESOURCE_SINGULAR = "order"

    extend Celery::EndpointMethods::ClassMethods
    include Celery::EndpointMethods::InstanceMethods

    attr_accessor :id, :status, :name, :image, :slug,
      :auto_charge, :seller, :buyer, :payment, :products,
      :coupon, :subtotal, :total, :deposit, :balance, :discount,
      :shipping, :taxes, :currency, :celery_payment_token, :card,
      :tracking, :fulfillment, :notes, :confirmation_url, :updated,
      :updated_date, :created, :created_date, :_id, :metadata, :flags

    def initialize(response={})
      attrs = response[self.class.object_root]
      attrs.each { |key, value| self.send("#{key}=", value) }
    rescue Exception => e
      raise Celery::Error.new(attrs)
    end

    def products=(products)
      @products = []
      products.each do |product|
        @products << Celery::Product.new(product)
      end
    end

    def buyer=(buyer)
      @buyer = Celery::Buyer.new(buyer)
    end

    def seller=(seller)
      @seller = Celery::Seller.new(seller)
    end

    def tracking=(tracking)
      @tracking = Celery::Tracking.new(tracking)
    end

    def card=(card)
      @card = Celery::Card.new(card)
    end

    def cancel
      response = endpoint_call(:get, "cancel")
      return true if response[self.class.object_root]
    end

    def charge_deposit
      response = endpoint_call(:post, "charge_deposit")
      return true if response[self.class.object_root]
    end


    class << self
      def decode(encoded_string)
        decoded_string = Base64.decode64(encoded_string)
        Celery::Order.new(object_root => JSON.parse(decoded_string))
      end
    end

    private
      def endpoint_call(http_verb, method)
        HTTParty.send(
          http_verb,
          "#{self.class.endpoint_path}/#{self.id}/#{method}?#{self.class.options}"
        )
      end
  end

end
