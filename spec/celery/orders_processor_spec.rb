require 'spec_helper'

describe Celery::OrdersProcessor do
  let!(:access_token)  { "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI1Mzg4ZTcxYzVkNTE5NDA1MDA0ZTNjM2MifQ.Vw1dikATVaAK5YLZFTPOXKpJJexa8T6NiRuE3nh1nAU" }
  let!(:orders)        { Celery::OrdersProcessor.new('https://api.trycelery.com/v1/', access_token) }

  it 'has the path for the endpoint' do
    expect(orders.endpoint_path).to eq('https://api.trycelery.com/v1/orders')
  end

  it 'receives all orders' do
    all_orders = orders.all
    expect(all_orders).to              be_kind_of Celery::Orders
    expect(all_orders.orders).to       be_kind_of Array
    expect(all_orders.orders.first).to be_kind_of Celery::Order
  end

  it 'receives 5 orders' do
    expect(orders.all(limit: 5).orders.count).to eq(5)
    expect(orders.all(limit: 7).orders.count).to eq(7)
  end

  it 'decodes an order from an encoded string' do
    order = JSON.parse(Base64.decode64(celery_encoded_order))
    celery_order = orders.decode_order(celery_encoded_order)

    expect(celery_order).to            be_kind_of Celery::Order
    expect(celery_order.id).to         eq(order['id'])
  end
end
