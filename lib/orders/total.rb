# frozen_string_literal: true

require_relative 'item_total'

# Module used for calculating the ordered total cost
module Orders
  # class responsible for order total
  class Total
    attr_reader :selected_item_ids

    def initialize(selected_item_ids = [])
      @selected_item_ids = selected_item_ids
    end

    def calculate
      Item.find(@selected_item_ids).inject(0.0) do |sum, item|
        sum + ItemTotal.new(item, @selected_item_ids).calculate
      end
    end
  end
end
