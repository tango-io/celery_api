class Celery::Coupon < Celery::Base
  ENDPOINT_RESOURCE          = 'coupons'
  ENDPOINT_RESOURCE_SINGULAR = 'coupon'

  extend Celery::EndpointMethods::ClassMethods
  include Celery::EndpointMethods::InstanceMethods

  attr_accessor :_id, :id, :user_id, :enabled, :code,
    :type, :discount, :quantity, :slugs,
    :emails, :tags, :product, :updated,
    :updated_date, :created, :created_date
end
