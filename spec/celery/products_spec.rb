require 'spec_helper'

describe Celery::Products do
  it 'returns all the products from the endpoint' do
    products = Celery::Products.all
    expect(products).to       be_kind_of Array
    expect(products.first).to be_kind_of Celery::Product
  end

  it 'builds the products based on the array' do
    products = [{ "id" => "1234" }]
    products = Celery::Products.build_products(products)
    expect(products.first).to    be_kind_of Celery::Product
    expect(products.first.id).to eq("1234")
  end
end
