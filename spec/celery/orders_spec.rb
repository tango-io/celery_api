require 'spec_helper'

describe Celery::Orders do
  it 'returns all the orders from the endpoint' do
    orders = Celery::Orders.all
    expect(orders).to       be_kind_of Array
    expect(orders.first).to be_kind_of Celery::Order
  end

  it 'builds the orders based on the array' do
    orders = [{ "id" => "1234" }]
    orders = Celery::Orders.build_orders(orders)
    expect(orders.first).to    be_kind_of Celery::Order
    expect(orders.first.id).to eq("1234")
  end

  it 'decodes the order' do
    order = Celery::Orders.decode_order(celery_encoded_order)
    expect(order.id).to eq(celery_decoded_order.id)
  end
end
