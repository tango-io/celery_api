require 'spec_helper'

describe Celery::User do
  let!(:attrs) { { "email" => Faker::Internet.email, "name" => Faker::Name.name } }
  let!(:user) { Celery::User.new(attrs) }

  it 'creates a new instance of user' do
    expect(user).to be_kind_of Celery::User
  end
end
