# Jungle

A mini e-commerce application built with Ruby on Rails 4.2.

## Final Product

### Homepage

!["Homepage View"](https://github.com/vdutz/jungle-rails/blob/master/docs/homepage2.png?raw=true)

### Product Details Page

!["Product Details Page"](https://github.com/vdutz/jungle-rails/blob/master/docs/product-detail-view.png?raw=true)

### Product Reviews

!["Product Reviews"](https://github.com/vdutz/jungle-rails/blob/master/docs/reviews-section.png?raw=true)

### My Cart Page

!["My Cart Page"](https://github.com/vdutz/jungle-rails/blob/master/docs/my-cart-view.png?raw=true)

### Visa Payment

!["Visa Payment View"](https://github.com/vdutz/jungle-rails/blob/master/docs/visa-payment-view.png?raw=true)

### Order Confirmation Page

!["Order Confirmation Page"](https://github.com/vdutz/jungle-rails/blob/master/docs/order-confirmation-page.png?raw=true)

### Order Email Receipt

!["Order Email Receipt"](https://github.com/vdutz/jungle-rails/blob/master/docs/order-email-receipt-simulation.png?raw=true)

### Admin Products Page

!["Admin Products Page"](https://github.com/vdutz/jungle-rails/blob/master/docs/admin-products-page.png?raw=true)

## View on Heroku

[Click here to view the Jungle web app on Heroku](http://guides.rubyonrails.org/v4.2/)

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account here: https://dashboard.stripe.com/register
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing order purchase scenarios.  Any CVC number and any card expiry date after the current date will work with this test card number.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
