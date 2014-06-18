require 'spec_helper'

describe Celery::Base do
  class Foo < Celery::Base
    attr_accessor :foo
  end

  it 'calls the accessor' do
    expect_any_instance_of(Foo).to receive(:foo=)
    Foo.new(foo: 'foo')
  end
end
