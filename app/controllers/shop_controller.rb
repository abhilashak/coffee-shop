# frozen_string_literal: true

# Handle the shopping!
class ShopController < ApplicationController
  # GET /
  def index
    @items_enum = Item.includes(:free_with_item, :discount_with_item)
                      .find_in_batches(batch_size: 200)
  end
end
