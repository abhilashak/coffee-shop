# frozen_string_literal: true

require 'rails_helper'

# This file checks quality of model Item
RSpec.describe Item, type: :model do
  before(:all) do
    ActiveRecord::Base.connection.execute('TRUNCATE items')
  end
  let(:valid_item) { Item.new(name: 'Name', price: 12.5, tax: 2.5) }
  let(:invalid_item) { Item.new(name: nil) }
  let(:item_1) { Item.create(name: 'Name 1', price: 2.0, tax: 0.3) }
  let(:item_2) { Item.create(name: 'Name 2', price: 4.15, tax: 1.1) }

  subject { Item.all }

  it 'is valid with valid attributes' do
    # verify
    expect(valid_item).to be_valid
  end

  it 'is not valid without :name, :price, :tax' do
    # verify
    expect(invalid_item).to_not be_valid
  end

  it 'list them in reverse chronologically' do
    # verify
    expect(subject).to eq([item_2, item_1])
  end

  # # it 'is not valid without discount_percentage if discount_with_item_id present'

  it 'item should have CATEGORIES constant present' do
    # verify
    expect(Item::CATEGORIES).to_not be_nil
    expect(Item::CATEGORIES.size).to eq(5)
  end

  it 'checks that an item can be destroyed' do
    # exercise
    item = Item.find_by(name: 'Name 1')
    item.destroy

    # verify
    expect(Item.find_by(name: 'Name 1')).to be_nil
    expect(Item.count).to eq(1)
  end
  # it 'is not valid if price has value other than round to .5'
end
