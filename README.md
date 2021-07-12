# README

A day at a coffee shop!

This software describes how you can spend a day at the coffee shop by shopping
a bunch of items in which some are free, some get discounted with other items.

* How to up and run this software

    1. Install Ruby 2.7.2
    2. Install Mysql, Git
    3. Open your terminal and do

        $ git clone git@github.com:abhilashak/coffee-shop.git

    4. Execute the following commands in your terminal
       
       Edit creadentials and add YOUR mysql username, password etc.
         
           $ EDITOR="code --wait" bin/rails credentials:edit

       Install the gems used in the software by doing bundle install

           $ bundle install

       Now create the database and populate the shop items to it

           $ rake db:reseed -t

       Last you start the puma app server by

           $ rails s

       Goto http://localhost:3000

       and spend your time and the day at the coffee shop!!

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

       3. For `Windows` systems add the following gem at the end of the Gemfile

            # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
            gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby] 

* Poulate data

How to use the module `PopulateData` for an Item model population
Goto the rails console and do the command

      $ rails c
      > PopulateData::ItemModel.new('sandwich', 1).fill

* Secret keys

`config/credentials.yml.enc`

Edit by

     $ bin/rails credentials:edit

     $ EDITOR="code --wait" bin/rails credentials:edit  # using vs code editor

> Without the --wait flag, your credentials.yml.enc will be saved immediately without giving you the chance to edit

Access by:

     $ Rails.application.credentials.dig(:key_name)

* Database initialization

      $ rake db:reseed -t      # drop, create db and seed data

* Optimizations needed

    1. Remove unwanted bootstrap js files from the system.
       Right now bootstrap gem loads default js files into the software
 

