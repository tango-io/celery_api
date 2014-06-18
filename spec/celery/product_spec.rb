require 'spec_helper'

describe Celery::Product, 'class methods' do
  let!(:products) { Celery::Product.all }
  it 'returns all the products from the endpoint' do
    expect(products).to       be_kind_of Array
    expect(products.first).to be_kind_of Celery::Product
  end

  it 'builds the products based on the array' do
    products = [{ "id" => "1234" }]
    products = Celery::Product.build_collection(products)
    expect(products.first).to    be_kind_of Celery::Product
    expect(products.first.id).to eq("1234")
  end

  it 'gets 1 product by id' do
    product = products.first
    expect(Celery::Product.get(product.id)).to    be_kind_of Celery::Product
    expect(Celery::Product.get(product.id).id).to eq(product.id)
  end

  it 'creates a new product' do
    attrs = {
      name: Faker::Lorem.word,
      price: 10000,
      deposit: 1000,
      options: []
    }

    product = Celery::Product.create(attrs)
    expect(product).to                         be_kind_of Celery::Product
    expect(Celery::Product.get(product.id).id).to eq(product.id)
  end
end
