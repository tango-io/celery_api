require 'spec_helper'

describe Celery::Order, 'class methods' do
  describe '.all' do
    it 'returns all the orders from the endpoint' do
      orders = Celery::Order.all
      expect(orders).to       be_kind_of Array
      expect(orders.first).to be_kind_of Celery::Order
    end
  end

  describe '.build_collection' do
    it 'builds the orders based on the array' do
      orders = [{ "id" => "1234" }]
      orders = Celery::Order.build_collection(orders)
      expect(orders.first).to    be_kind_of Celery::Order
      expect(orders.first.id).to eq("1234")
    end
  end

  describe '.decode' do
    it 'decodes the order' do
      order = Celery::Order.decode(celery_encoded_order)
      expect(order.id).to eq(celery_decoded_order.id)
    end
  end

  describe '.get' do
    let!(:attrs) do
      {
        seller_id: "53c69672237dd10700bb65af",
        buyer: {
          "email" => Faker::Internet.email,
          "name"=> Faker::Name.name,
          "address"=> {
            "company_name"=>"",
            "street"=>"asdfasdf",
            "street2"=>"",
            "city"=>"asdfasfa",
            "state"=>"asdfasdf",
            "zip"=>"1231234",
            "country"=>"MX",
            "phone"=>""
          },
        },
        products: [ { "slug"=>"choco-cake", "name"=>"Chocholate cake", "quantity"=>1 } ]
      }
    end

    let!(:order) { Celery::Order.create(attrs) }

    it 'returns an order from celery' do
      order_from_celery = Celery::Order.get(order.id)

      expect(order_from_celery).to be_kind_of Celery::Order
      expect(order_from_celery.id).to eq(order.id)
    end
  end

  describe '.create' do
    let!(:attrs) do
      {
        seller_id: "5388e71c5d519405004e3c3c",
        buyer: {
          "email" => Faker::Internet.email,
          "name"=> Faker::Name.name,
          "address"=> {
            "company_name"=>"",
            "street"=>"asdfasdf",
            "street2"=>"",
            "city"=>"asdfasfa",
            "state"=>"asdfasdf",
            "zip"=>"1231234",
            "country"=>"MX",
            "phone"=>""
          },
        },
        products: [ { "slug"=>"choco-cake", "name"=>"Chocholate cake", "quantity"=>1 } ]
      }
    end

    it 'creates the order' do
      order = Celery::Order.create(attrs)
      expect(order).to be_kind_of Celery::Order
    end
  end

end

describe Celery::Order, 'instance methods' do
  let!(:attrs) do
    {
      seller_id: "5388e71c5d519405004e3c3c",
      buyer: {
        "email" => Faker::Internet.email,
        "name"=> Faker::Name.name,
        "address"=> {
          "company_name"=>"",
          "street"=>"asdfasdf",
          "street2"=>"",
          "city"=>"asdfasfa",
          "state"=>"asdfasdf",
          "zip"=>"1231234",
          "country"=>"MX",
          "phone"=>""
        },
      },
      products: [ { "slug"=>"choco-cake", "name"=>"Chocholate cake", "quantity"=>1 } ]
    }
  end

  let!(:order) { Celery::Order.create(attrs) }

  it { expect(order.products.first).to be_kind_of Celery::Product }
  it { expect(order.buyer).to be_kind_of Celery::Buyer            }
  it { expect(order.seller).to be_kind_of Celery::Seller          }
  it { expect(order.tracking).to be_kind_of Celery::Tracking      }
  it { expect(order.card).to be_kind_of Celery::Card              }

  describe '#update' do
    it 'updates the order' do
      expect(order.update(buyer: { name: Faker::Name.name })).to eq(true)
      new_order = Celery::Order.get(order.id)
      expect(new_order.name).to eq(order.name)
    end
  end

  describe '#destroy' do
    it 'destroys the order' do
      expect(order.destroy).to eq(true)

      expect { Celery::Order.get(order.id) }.to raise_error
    end
  end

  describe '#cancel' do
    it 'cancels the order' do
      expect(order.cancel).to eq(true)
    end
  end

  describe "#charge_deposit" do
    it 'charges the order\'s deposit'
  end
end
