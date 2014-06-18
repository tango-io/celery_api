require 'spec_helper'

describe Celery::Order, 'class methods' do
  it 'returns all the orders from the endpoint' do
    orders = Celery::Order.all
    expect(orders).to       be_kind_of Array
    expect(orders.first).to be_kind_of Celery::Order
  end

  it 'builds the orders based on the array' do
    orders = [{ "id" => "1234" }]
    orders = Celery::Order.build_orders(orders)
    expect(orders.first).to    be_kind_of Celery::Order
    expect(orders.first.id).to eq("1234")
  end

  it 'decodes the order' do
    order = Celery::Order.decode(celery_encoded_order)
    expect(order.id).to eq(celery_decoded_order.id)
  end
end

describe Celery::Order, 'instance methods' do
  let!(:order) { celery_decoded_order }

  it 'returns an instance of the celery product' do
    expect(order.products).to       be_kind_of Array
    expect(order.products.first).to be_kind_of Celery::Product
  end

  it 'returns an instance of the celery buyer' do
    expect(order.buyer).to be_kind_of Celery::Buyer
  end

  it 'returns an instance of the celery seller' do
    expect(order.seller).to be_kind_of Celery::Seller
  end

  it 'returns an instance of the celery tracking' do
    expect(order.tracking).to be_kind_of Celery::Tracking
  end

  it 'returns an instance of the celery card' do
    expect(order.card).to be_kind_of Celery::Card
  end
end
