# README
[test international payments](https://bravo-webdev.herokuapp.com/)
regitster at coingate sandbox and get an api key.
change it at app/services/coingate_merchant
you need ruby (~3), rails (~7), npm, yarn, postgresql and bundler. There are tutirials at DigitalOcean how to install in on Ubuntu
git clone https://github.com/RaptorialThing/uinterpay.git
bundle install
rails db:setup
rails db:migrate
bin/dev
enjoy it at http://localhost:3000

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
