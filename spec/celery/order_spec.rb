require 'spec_helper'

describe Celery::Order do
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
