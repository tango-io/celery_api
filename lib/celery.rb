require 'httparty'
require 'addressable/uri'

module Celery
  autoload :Config, "celery/config"
  extend Celery::Config

  autoload :User, "celery/user"
  autoload :Base, "celery/base"
  autoload :Card, "celery/card"
  autoload :Buyer, "celery/buyer"
  autoload :Order, "celery/order"
  autoload :Orders, "celery/orders"
  autoload :Seller, "celery/seller"
  autoload :Address, "celery/address"
  autoload :Billing, "celery/billing"
  autoload :Product, "celery/product"
  autoload :Products, "celery/products"
  autoload :Tracking, "celery/tracking"
end
