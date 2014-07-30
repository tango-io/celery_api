require 'httparty'
require 'addressable/uri'

module Celery
  autoload :Config, "celery/config"
  extend Celery::Config

  autoload :User, "celery/user"
  autoload :Base, "celery/base"
  autoload :Card, "celery/card"
  autoload :Shop, "celery/shop"
  autoload :Buyer, "celery/buyer"
  autoload :Order, "celery/order"
  autoload :Seller, "celery/seller"
  autoload :Address, "celery/address"
  autoload :Billing, "celery/billing"
  autoload :Product, "celery/product"
  autoload :Tracking, "celery/tracking"
  autoload :Coupon, 'celery/coupon'
  autoload :EndpointMethods, "celery/endpoint_methods"
end
