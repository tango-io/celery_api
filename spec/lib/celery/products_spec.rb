require 'spec_helper'

describe Celery::Products do
  let!(:attrs) do
    {
      "total"    => 10,
      "count"    => 10,
      "limit"    => 0,
      "offset"   => 0,
      "has_more" => false,
      "products" => [ { "id" => 'foo' } ]
    }
  end
  let!(:products) { Celery::Products.new(attrs) }

  it 'returns an instance of the celery product' do
    expect(products.products).to       be_kind_of Array
    expect(products.products.first).to be_kind_of Celery::Product
  end
end
