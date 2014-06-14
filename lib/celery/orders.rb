module Celery

  class Orders < Base
    attr_accessor :total, :count, :limit,
      :offset, :has_more, :orders

    def orders=(orders)
      @orders = []
      orders.each do |order|
        @orders << Celery::Order.new(order)
      end
    end
  end

end
