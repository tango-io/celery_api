require 'spec_helper'

describe Celery::Product do
  it 'returns all the products from the endpoint' do
    products = Celery::Product.all
    expect(products).to       be_kind_of Array
    expect(products.first).to be_kind_of Celery::Product
  end

  it 'builds the products based on the array' do
    products = [{ "id" => "1234" }]
    products = Celery::Product.build_collection(products)
    expect(products.first).to    be_kind_of Celery::Product
    expect(products.first.id).to eq("1234")
  end
end
