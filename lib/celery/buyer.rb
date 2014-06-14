module Celery

  class Buyer < Base
    attr_accessor :email, :name, :address, :billing

    def address=(address)
      @address = Celery::Address.new(address)
    end

    def billing=(billing)
      @billing = Celery::Billing.new(billing)
    end
  end

end
