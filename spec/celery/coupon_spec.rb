require 'spec_helper'

describe Celery::Coupon, '.all' do
  it 'returns all the existent coupons' do
    expect(Celery::Coupon.all.first).to be_kind_of(Celery::Coupon)
  end
end
