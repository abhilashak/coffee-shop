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
        render json: {
          total: total, order_id: order&.id, complete_link: complete_orders_url
        }
      end
    end
  end

  # PUT  /orders/complete
  def complete
    order = Order.find_by(id: order_id_params)
    order&.completed!

    respond_to do |format|
      format.json do
        render json: { order_id: order&.id }
      end
    end
  end

  private

  def item_params
    params.permit(items: [])['items'].try(:reject, &:blank?)
  end

  def order_id_params
    params.permit(:order_id)['order_id']
  end
end
