# frozen_string_literal: true

require 'populate_data'

namespace :db do
  include PopulateData

  desc 'Reset the database and populate sample data'
  task reseed: [:drop, :create, 'schema:load', :seed, :populate_sample_data] do
    puts 'Reseeding completed'
  end

  desc 'Populates the database with sample data'
  task populate_sample_data: :environment do
    Item::CATEGORIES.each do |c|
      10.times do |i|
        PopulateData::ItemModel.new(c, i + 1).fill
      end
    end
  end
end
