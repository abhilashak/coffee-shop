# frozen_string_literal: true

# Module used for calculating the ordered item total cost
module Orders
  # class responsible for item total
  class ItemTotal
    attr_reader :item, :selected_item_ids

    DISC_MODES = %w[free discount].freeze

    def initialize(item_id, selected_item_ids)
      @item = Item.find(item_id)
      @selected_item_ids = selected_item_ids
    end

    # calculate the cost of an item by checking 3 conditions
    # 1. Item is free with other item
    # 2. Item is discounted with other item
    # 3. Item is neither free nor discounted
    def calculate
      return @item.cost unless @item.free_or_discounted?

      @item.free? ? cost_of_free_item : cost_of_discount_item
    end

    DISC_MODES.each do |m|
      # calculates the cost of free or discount item
      define_method("cost_of_#{m}_item") do
        return send("cost_after_#{m}") if send("#{m}_with_item_selected?")

        @item.cost
      end

      # checks user selected free with or discount with item or not
      define_method("#{m}_with_item_selected?") do
        @selected_item_ids.include?(@item.send("#{m}_with_item_id").to_s)
      end

      # discount: discount gets on price not on tax. Tax will be same
      # free: item is free of cost
      define_method("cost_after_#{m}") do
        return 0.0 if m.eql?('free')

        discount = @item.price * @item.discount_percentage / 100
        @item.price - discount + @item.tax
      end
    end
  end
end
