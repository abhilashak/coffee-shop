# frozen_string_literal: true

# Module used for calculating the ordered item total cost
module Orders
  # class responsible for item total
  class ItemTotal
    attr_reader :item, :selected_item_ids

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

      @item.free? ? cost_of_free_item : cost_of_discounted_item
    end

    # user selected the parent item and the free item
    # so the item is free of cost
    def cost_of_free_item
      return 0.0 if @selected_item_ids.include?(@item.free_with_item_id.to_s)

      @item.cost
    end

    # user selected the parent item and the free item
    # so the item is free of cost
    def cost_of_discounted_item
      return cost_after_discount if @selected_item_ids.include?(@item.discount_with_item_id.to_s)

      @item.cost
    end

    def cost_after_discount
      discount = (@item.price * @item.discount_percentage / 100)
      @item.price - discount
    end
  end
end
