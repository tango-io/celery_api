# Celery API

[![Build Status](https://travis-ci.org/tangosource/celery_api.svg?branch=master)](https://travis-ci.org/tangosource/celery_api)
[![Code Climate](https://codeclimate.com/github/tangosource/celery_api.png)](https://codeclimate.com/github/tangosource/celery_api)
[![Code Climate](https://codeclimate.com/github/tangosource/celery_api/coverage.png)](https://codeclimate.com/github/tangosource/celery_api)
[![Gem Version](https://badge.fury.io/rb/celery_api.svg)](http://badge.fury.io/rb/celery_api)
[![Stories in Ready](https://badge.waffle.io/tangosource/celery_api.png?label=ready&title=Ready)](https://waffle.io/tangosource/celery_api)

Celery API wrapper


* [Celery API documentation](https://www.trycelery.com/developer)

## Usage

Add your celery API key.

``` ruby
Celery.access_token = "foo"
```

### Products

Get all the products from the API.

``` ruby
Celery::Product.all
# => [#<Celery::Product @id="foo", @name="Foo bar", @slug="foo-bar">]
```

### Orders

Get all the orders from the API.

``` ruby
Celery::Order.all
# => [#<Celery::Order
  @id="foo",
  @buyer= #<Celery::Buyer:0x00000101162ea0>,
  @card=#<Celery::Card:0x0000010115a840>,
  @name="Chocholate cake",
  @notes="",
  @products= [#<Celery::Product:0x000001011605b0>],
  @status="paid_balance",
  @subtotal=0,
  @taxes=0,
  @total=0>]
```

Decode an order from the confirmation page payload.

``` ruby
Celery::Order.decode_order(params[:order])
# => #<Celery::Order
  @id="foo",
  @buyer= #<Celery::Buyer:0x00000101162ea0>,
  @card=#<Celery::Card:0x0000010115a840>,
  @name="Chocholate cake",
  @notes="",
  @products= [#<Celery::Product:0x000001011605b0>],
  @status="paid_balance",
  @subtotal=0,
  @taxes=0,
  @total=0>
```

### User

It gets the store owner profile

``` ruby
user = Celery::User.me
# => #<Celery::User
  @_id="foo",
  @access_token="foo",
  @affirm={},
  @analytics={"ga_id"=>"", "perfect_audience_id"=>""},
  @business={"name"=>nil, "email"=>nil, "phone"=>nil},
  @confirmation_url="",
  @created=1401480988785,
  @created_date="2014-05-30T20:16:28.785Z",
  @currency="usd",
  @email="email@example.com",
  @emails={},
  @facebook=nil,
  @flags={"hide_stripe"=>false},
  @has_affirm=true,
  @has_paypalx=false,
  @id="foo",
  @message_to_buyer=nil,
  @name="John Doe",
  @nexus=[],
  @notifications={},
  @paypal_email="",
  @shipping_rates={},
  @stripe={},
  @subscription={},
  @tax_rates={},
  @twitter="",
  @updated=1403064604899,
  @updated_date="2014-06-18T04:10:04.899Z",
  @webhooks={},
  @website=nil>
```

It updates the user

``` ruby
user = Celery::User.me
user.update(twitter: '@foo')
# => true
```

## Roadmap

* Finish Orders and Products endpoint
* Add coupons endpoint
* Add shop endpoint

The MIT License (MIT)

Copyright (c) 2014 TangoSource LLC, QueueTechnologies Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
