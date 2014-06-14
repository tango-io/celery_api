require 'spec_helper'

describe Celery::Orders do
  let!(:attrs) do
    {
      "total"    => 10,
      "count"    => 10,
      "limit"    => 0,
      "offset"   => 0,
      "has_more" => false,
      "orders" => [ { "id" => 'foo' } ]
    }
  end

  let!(:orders) { Celery::Orders.new(attrs) }

  it 'returns an instance of the celery order' do
    expect(orders.orders).to       be_kind_of Array
    expect(orders.orders.first).to be_kind_of Celery::Order
  end
end
