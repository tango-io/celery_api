require 'spec_helper'

describe Celery::Buyer do
  let!(:attrs) do
    {
      "email"    => Faker::Internet.email,
      "name"     => Faker::Name.name,
      "address"  => { },
      "billing"  => { }
    }
  end
  let!(:buyer) { Celery::Buyer.new(attrs) }

  it 'creates a new instance of address' do
    expect(buyer.address).to be_kind_of Celery::Address
  end

  it 'creates a new instance of billing' do
    expect(buyer.billing).to be_kind_of Celery::Billing
  end
end
