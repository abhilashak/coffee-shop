# frozen_string_literal: true

# Module used for calculating the ordered item total cost
module Orders
  # class responsible for item total
  class ItemTotal
    attr_reader :item, :selected_item_ids

    DISC_MODES = %w[free_item discount_item].freeze

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

    # If the user selected the parent item and the free item
    # then the item is free of cost
    def cost_of_free_item
      return 0.0 if free_item_with_selected?

      @item.cost
    end

    # user selected the parent item and the free item
    # so the item is free of cost
    def cost_of_discount_item
      return cost_after_discount if discount_item_with_selected?

      @item.cost
    end

    # checks user selected free with or discount with item or not
    DISC_MODES.each do |m|
      define_method("#{m}_with_selected?") do
        @selected_item_ids.include?(@item.send("#{m}_with_id").to_s)
      end
    end

    # discount gets on price not on tax. Tax will be same
    def cost_after_discount
      discount = @item.price * @item.discount_percentage / 100
      @item.price - discount + @item.tax
    end
  end
end
