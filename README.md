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
# => [#<Celery::Product:0x00000103508918 @id="5388e7749ee1950400de0555", @name="Chocholate cake", @slug="choco-cake">]
```

### Orders

Get all the orders from the API.

``` ruby
Celery::Order.all
# => [#<Celery::Order:0x0000010116aa10
  @id="101475307",
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
# => #<Celery::Order:0x0000010116aa10
  @id="101475307",
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

## Roadmap

* Finish Orders and Products endpoint
* Add users endpoint
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
