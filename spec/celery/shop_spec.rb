require 'spec_helper'

describe Celery::Shop, 'class methods' do
  let!(:product) { Celery::Product.all.first }

  it 'gets the shop using the SLUG' do
    expect(Celery::Shop.get(product.slug)).to be_kind_of Celery::Product
  end

  it 'checks if a product is present' do
    expect(Celery::Shop.slugify(product.slug)).to eq(false)
  end
end
