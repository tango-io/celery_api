require 'spec_helper'

describe Celery::ProductsProcessor do
  let!(:access_token) { "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI1Mzg4ZTcxYzVkNTE5NDA1MDA0ZTNjM2MifQ.Vw1dikATVaAK5YLZFTPOXKpJJexa8T6NiRuE3nh1nAU" }
  let!(:products)     { Celery::ProductsProcessor.new('https://api.trycelery.com/v1/', access_token) }

  it 'has the path for the endpoint' do
    expect(products.endpoint_path).to eq('https://api.trycelery.com/v1/products')
  end

  it 'receives all products' do
    all_products = products.all
    expect(all_products).to                be_kind_of Celery::Products
    expect(all_products.products).to       be_kind_of Array
    expect(all_products.products.first).to be_kind_of Celery::Product
  end

  it 'receives 5 products' do
    expect(products.all(limit: 1).products.count).to eq(1)
  end
end
