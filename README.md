# README

A day at a coffee shop!

This software describes how you can spend a day at the coffee shop by shopping
a bunch of items in which some are free, some get discounted with other items.

* Project Description

1. One shop item is FREE with other item
2. One shop item get at a discount (on price, not on tax) with other item
3. One shop item is neither free nor discount
4. The above info has been added upon a probability criteria (in seeding data)
5. The price is calculated on selected items. Price + tax will be the total cost of each item
6. Payment successful is shown in the screen


# How to up and run this software

    1. Install Ruby 2.7.2
    2. Install Mysql, Git
    3. Open your terminal and do

        $ git clone git@github.com:abhilashak/coffee-shop.git

    3. Create a Gemset called `coffee-shop` to install the gems of the application else you are free to modify the file `.ruby-gemset` or delete as per your convenience.
    
    4. Execute the following commands in your terminal
       
       * Install the gems for this software

           $ bundle install

       * Generate new `config/credentials.yml.enc` file. Follow the steps.

            1. Edit the creadentials and add YOUR mysql username, password
               Refer the sample file: `credentials.yml.enc.sample`
         
               $ EDITOR="code --wait" bin/rails credentials:edit

               this opens the file in VS Code editor. If you want to open in any other editor you can modify the command 'code' (like mate, sublime)

               Now add the contents of the sample file to it: `credentials.yml.enc.sample`. Here you update YOUR mysql username and password

               Close the yml file. Now you have both `config/master.key` & `config/credentials.yml.enc`


       * Now create the database and populate the shop items to it

           $ rake db:reseed -t

       * Start the puma app server by

           $ rails s

       Goto http://localhost:3000

       and spend your time and the day at the coffee shop!

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

`config/credentials.yml.enc`  # this is now excluded from git

Refer the sample file: `credentials.yml.enc.sample`

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
 

