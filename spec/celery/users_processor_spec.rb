require 'spec_helper'

describe Celery::UsersProcessor do
  let!(:access_token) { "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI1Mzg4ZTcxYzVkNTE5NDA1MDA0ZTNjM2MifQ.Vw1dikATVaAK5YLZFTPOXKpJJexa8T6NiRuE3nh1nAU" }
  let!(:users)        { Celery::UsersProcessor.new('https://api.trycelery.com/v1/', access_token) }

  it 'has an endpoint path' do
    expect(users.endpoint_path).to eq("https://api.trycelery.com/v1/users/me")
  end

  it 'returns my celery profile' do
    expect(users.me).to be_kind_of Celery::User
  end

  it 'returns the response' do
    expect(users.send(:get_user)).to be_kind_of Hash
  end
end
