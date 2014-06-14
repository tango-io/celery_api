require 'spec_helper'

describe Celery::Base do
  Celery::Base.class_eval do
    attr_accessor :foo
  end

  it 'calls the accessor' do
    expect_any_instance_of(Celery::Base).to receive(:foo=)
    Celery::Base.new(foo: 'foo')
  end
end
