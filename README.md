# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.
![screenshot_1](https://github.com/Cclarkes/jungle-rails/blob/master/Screenshot%20from%202019-03-23%2019-37-06.png)

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

![screenshot_2](https://github.com/Cclarkes/jungle-rails/blob/master/Screenshot%20from%202019-03-23%2019-37-23.png)
## Stripe Testing

Use Credit Card # 4242 4242 4242 4242 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* BCrypt
