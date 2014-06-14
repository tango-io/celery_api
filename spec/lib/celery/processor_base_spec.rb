require 'spec_helper'

describe Celery::ProcessorBase do
  let!(:access_token)   { "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI1Mzg4ZTcxYzVkNTE5NDA1MDA0ZTNjM2MifQ.Vw1dikATVaAK5YLZFTPOXKpJJexa8T6NiRuE3nh1nAU" }
  let!(:base_processor) { Celery::ProcessorBase.new('https://api.trycelery.com/v1/', access_token) }

  it 'receives the access token' do
    expect(base_processor.access_token).to eq(access_token)
  end

  it 'parameterizes a hash of arguments' do
    hash = { limit: 0 } ; uri = Addressable::URI.new ; uri.query_values = hash.merge(access_token: access_token)
    expect(base_processor.send(:parameterize_options, hash)).to eq(uri.query)
  end
end
