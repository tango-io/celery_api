module Celery

  class Products < Base
    attr_accessor :total, :count, :limit,
      :offset, :has_more, :products

    def products=(products)
      @products = []
      products.each do |product|
        @products << Celery::Product.new(product)
      end
    end
  end

end
