# frozen_string_literal: true

require 'orders/total'

# Handle the orders!
class OrdersController < ApplicationController
  include Orders

  # POST /orders
  def create
    total = Orders::Total.new(item_params).calculate
    order = Order.create_with_items(item_params, total)
    respond_to do |format|
      format.json do
        render json: { total: total, order_id: order&.id }
      end
    end
  end

  private

  def item_params
    params.permit(items: [])['items'].try(:reject, &:blank?)
  end
end
