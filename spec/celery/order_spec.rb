require 'spec_helper'

describe Celery::Order, 'class methods' do
  it 'returns all the orders from the endpoint' do
    orders = Celery::Order.all
    expect(orders).to       be_kind_of Array
    expect(orders.first).to be_kind_of Celery::Order
  end

  it 'builds the orders based on the array' do
    orders = [{ "id" => "1234" }]
    orders = Celery::Order.build_collection(orders)
    expect(orders.first).to    be_kind_of Celery::Order
    expect(orders.first.id).to eq("1234")
  end

  it 'decodes the order' do
    order = Celery::Order.decode(celery_encoded_order)
    expect(order.id).to eq(celery_decoded_order.id)
  end

  describe '.get' do
    let(:order) { celery_decoded_order }

    it 'returns an order from celery' do
      order_from_celery = Celery::Order.get(order.id)

      expect(order_from_celery).to be_kind_of Celery::Order
      expect(order_from_celery.id).to eq(order.id)
    end
  end

  describe '.create' do
    let!(:attrs) {
      {
        seller_id: "5388e71c5d519405004e3c3c",
        buyer: {
          "email" => Faker::Internet.email,
          "name"=> Faker::Name.name,
          "address"=> { "company_name"=>"", "street"=>"asdfasdf", "street2"=>"", "city"=>"asdfasfa", "state"=>"asdfasdf", "zip"=>"1231234", "country"=>"MX", "phone"=>"" },
        },
        products: [ { "slug"=>"choco-cake", "name"=>"Chocholate cake", "quantity"=>1 } ]
      }
    }

    it 'creates the order' do
      order = Celery::Order.create(attrs)
      expect(order).to be_kind_of Celery::Order
    end
  end
end

describe Celery::Order, 'instance methods' do
  let!(:order) { celery_decoded_order }

  it { expect(order.products.first).to be_kind_of Celery::Product }
  it { expect(order.buyer).to be_kind_of Celery::Buyer            }
  it { expect(order.seller).to be_kind_of Celery::Seller          }
  it { expect(order.tracking).to be_kind_of Celery::Tracking      }
  it { expect(order.card).to be_kind_of Celery::Card              }
end
