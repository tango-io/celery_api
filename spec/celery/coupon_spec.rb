require 'spec_helper'

describe Celery::Coupon, '.all' do
  before :all do
    @coupon = Celery::Coupon.all[0]
  end

  describe '.all' do
    it 'returns all the existent coupons' do
      expect(Celery::Coupon.all[0]).to be_kind_of(Celery::Coupon)
    end
  end

  describe '.create' do
    let(:attrs) do
      {
        type: 'percent',
        code: Faker::Lorem.word,
        discount: 10
      }
    end

    it 'creates a new coupon' do
      coupon = Celery::Coupon.create(attrs)
      expect(coupon._id).to_not be_nil
    end
  end

  describe '.get' do
    it 'finds a coupon by id' do
      found_coupon = Celery::Coupon.get(@coupon._id)
      expect(found_coupon.code).to eq(@coupon.code)
    end
  end

  describe '.update' do
    let(:new_code) { Faker::Lorem.word }
    before         { @coupon.update(code: new_code) }

    it 'updates a coupon' do
      expect(@coupon.code).to eq(new_code)
    end
  end

  describe '.delete' do
    it 'deletes a coupon' do
      expect(@coupon.destroy).to eq(true)
    end
  end
end
