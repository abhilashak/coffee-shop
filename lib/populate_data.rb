# frozen_string_literal: true

# Module used for populating sample data
module PopulateData
  # Class responsible for item population
  class ItemModel
    attr_reader :category, :index
    attr_accessor :price, :tax, :free_item_id, :disc_item_id, :disc_per

    # constants
    # normal items price, tax in $
    MAX_PRICE = 5.0
    MAX_TAX   = 1.0
    # expensive items price, tax in $
    EXPS_MAX_PRICE = 20.0
    EXPS_MAX_TAX   = 5.0

    def initialize(category, index)
      # `category` of the item and an unique value `index` to initialize the object
      @category = category
      @index = index
      # calculate the price and tax of the item
      cal_price_tax
      # calculate the item is free or discount with some other item
      cal_free_or_discount
    end

    # fill all columns of an item
    def fill
      Item.create!(
        name: "#{@category.titleize} #{@index}",
        price: @price,
        tax: @tax,
        category: @category,
        free_with_item_id: @free_item_id,
        discount_with_item_id: @disc_item_id,
        discount_percentage: @disc_per
      )
    end

    # There is less chance of the price of an item in the coffee shop
    # be more than $10
    def cal_price_tax
      max_price = MAX_PRICE
      max_tax = MAX_TAX
      if high_priced?
        max_price = EXPS_MAX_PRICE
        max_tax = EXPS_MAX_TAX
      end

      # make price nearest to $0.5 value
      @price = (rand(1.0..max_price) * 2).round / 2.0
      @tax   = rand(0.0..max_tax).round(2)
    end

    # There is less chance of item tax in the coffee shop be more than $5
    def cal_free_or_discount
      return unless can_give_as_disc_or_free?

      # if the item is free or discount with other item
      parent = Item.random.first
      return if free_or_disc_item?(parent)

      give_as_free_or_disc_with(parent)
    end

    private

    # provides the parent item value with that item this item gets free or discounted
    def give_as_free_or_disc_with(parent)
      if can_give_free?
        @free_item_id = parent.id
        return
      end

      @disc_item_id = parent.id
      @disc_per     = discount_percent
    end

    # not consider to be free or discount with other item because
    # the random parent item is already free/discount with some other item
    # here we are not considering searching a random parent item again because
    # it may leads to a infinite search for a parent item with lots of records
    def free_or_disc_item?(item)
      !item || item.free_or_discounted?
    end

    # the item has a high price
    # 20% chance of the item has high price
    def high_priced?
      rand < 0.2
    end

    # the item has a discount or it will get free with other item
    # 35% chance of getting free or discount
    def can_give_as_disc_or_free?
      rand < 0.35
    end

    # 50% chance to get as free versus discounted
    def can_give_free?
      rand < 0.5
    end

    # 1 - 70 percentage discount
    def discount_percent
      rand(1..70)
    end
  end
end
