require 'spec_helper'

describe Celery::User, 'class methods' do
  it 'gets the user' do
    expect(Celery::User.me).to be_kind_of Celery::User
  end


  describe 'Exceptions' do
    it 'raises an error' do
      expect do
        Celery::User.new("Resource not found")
      end.to raise_error Celery::Error, "Resource not found"
    end

    it 'raises an error when the attribute does not correspond with the class' do
      expect do
        Celery::User.new(foo: 'foo')
      end.to raise_error Celery::Error
    end
  end
end

describe Celery::User, 'instance methods' do
  let!(:attrs) { { "email" => Faker::Internet.email, "name" => Faker::Name.name } }
  let!(:user) { Celery::User.me }

  it 'creates a new instance of user' do
    expect(user).to be_kind_of Celery::User
  end

  context 'Update' do
    it 'performs the action' do
      expect(user.update(name: 'Antonio')).to eq(true)
      expect(user.name).to eq('Antonio')
    end

    it "does not perform the action if there's no product present" do
      expect{
        user.update(foo: 'foo')
      }.to raise_error NoMethodError
    end
  end
end
