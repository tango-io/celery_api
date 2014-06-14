require 'spec_helper'

describe Celery::Client do
  let!(:access_token)    { "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI1Mzg4ZTcxYzVkNTE5NDA1MDA0ZTNjM2MifQ.Vw1dikATVaAK5YLZFTPOXKpJJexa8T6NiRuE3nh1nAU" }
  let!(:client) { Celery::Client.new(access_token: access_token) }

  it 'has the access_token' do
    expect(client.access_token).to eq(access_token)
  end

  it 'has the API endpoint defined' do
    expect(client.send(:endpoint)).to eq("https://api.trycelery.com/v1/")
  end

  it 'returns an instance of the orders processor object' do
    expect(client.orders).to be_kind_of Celery::OrdersProcessor
  end

  it 'returns an instance of the products processor object' do
    expect(client.products).to be_kind_of Celery::ProductsProcessor
  end
end
