module CeleryOrderHelper
  def celery_encoded_order
    @celery_encoded_order ||= File.read("#{File.dirname(__FILE__)}/fixtures/celery_encoded_order.txt")
  end

  def celery_decoded_order
    @decoded_order ||= Celery::Order.decode(celery_encoded_order)
  end
end
