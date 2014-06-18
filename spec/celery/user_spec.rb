require 'spec_helper'

describe Celery::User, 'class methods' do

  it 'gets the user' do
    expect(Celery::User.me).to be_kind_of Celery::User
  end

end

describe Celery::User, 'instance methods' do
  let!(:attrs) { { "email" => Faker::Internet.email, "name" => Faker::Name.name } }
  let!(:user) { Celery::User.new(attrs) }

  it 'creates a new instance of user' do
    expect(user).to be_kind_of Celery::User
  end
end
