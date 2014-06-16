require 'spec_helper'

describe Celery do
  it { should be_kind_of Module         }
  it { should respond_to :access_token  }
  it { should respond_to :access_token= }
  it { should respond_to :endpoint      }

  it 'returns the endpoint' do
    expect(Celery.endpoint).to eq("https://api.trycelery.com/v1/")
  end

  it 'assigns the access_token' do
    Celery.access_token = "foo"
    expect(Celery.access_token).to eq("foo")
  end

  it 'parameterizes a hash of arguments' do
    hash             = { limit: 0 }
    uri              = Addressable::URI.new
    uri.query_values = hash.merge(access_token: "foo")
    expect(Celery.parameterize_options(hash)).to eq(uri.query)
  end
end
