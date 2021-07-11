# README

A day at a coffee shop!

This software describes how you can spend a day at a coffee shop by shopping
whatever you want.

* How to up and running this software

    1. Install Ruby 2.7.2
    2. Install Rails 5.2.6
    3. Install Git, Mysql
    4. Open your terminal and do 
       $ git clone git@github.com:abhilashak/coffee-shop.git
    5. Execute the following commands in your terminal
       Edit creadentials and add mysql username, password etc.
         $ EDITOR="code --wait" bin/rails credentials:edit
       $ bundle install
       $ rake db:reseed -t
       $ rails s
       Goto http://localhost:3000
       and spend your day at a coffee shop!

* Ruby version used

      2.7.2

* Rails version used

      5.2.6

* Plugins/Libraries used

       1. Bootstrap scss
       2. Slim template engine
       3. Puma server
       4. Mysql Database

* System dependencies
       1. Mysql essential libraries
          mysql dependencies, mysql server, mysql client
       2. RVM
          Install rvm, ruby via rvm, rails 5.2.6

* Poulate data
How to use the module `PopulateData` for an Item model population
Goto the rails console and do the command

     $ rails c
     > PopulateData::ItemModel.new('sandwich', 1).fill

* Configuration

* Secret keys

config/credentials.yml.enc

Edit by

     $ bin/rails credentials:edit

     $ EDITOR="code --wait" bin/rails credentials:edit  # using vs code editor

Without the --wait flag, your credentials.yml.enc will be saved immediately without giving you the chance to edit

Access by:

     $ Rails.application.credentials.dig(:key_name)

* Database initialization

      $ rake db:reseed -t      # drop, create db and seed data

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
