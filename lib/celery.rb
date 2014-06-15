require 'httparty'
require 'addressable/uri'

module Celery
  autoload :Base,              "celery/base"
  autoload :Buyer,             "celery/buyer"
  autoload :Card,              "celery/card"
  autoload :Order,             "celery/order"
  autoload :Client,            "celery/client"
  autoload :Orders,            "celery/orders"
  autoload :Seller,            "celery/seller"
  autoload :Address,           "celery/address"
  autoload :Billing,           "celery/billing"
  autoload :Product,           "celery/product"
  autoload :Products,          "celery/products"
  autoload :Tracking,          "celery/tracking"
  autoload :ProcessorBase,     "celery/processor_base"
  autoload :ShopsProcessor,    "celery/shops_processor"
  autoload :OrdersProcessor,   "celery/orders_processor"
  autoload :UsersProcessor,    "celery/users_processor"
  autoload :CouponsProcessor,  "celery/coupons_processor"
  autoload :ProductsProcessor, "celery/products_processor"
end
