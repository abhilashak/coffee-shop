# README

A day at a coffee shop!

This software descibes how you can spend a day at a coffee shop by shopping
whatever you want.

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

      $ rake db:create -t    # create 
      $ rake db:migrate -t   # migrate
      $ rake db:seed -t      # seed data

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
