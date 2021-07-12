# frozen_string_literal: true

require 'orders/total'

# Handle the orders!
class OrdersController < ApplicationController
  include Orders

  def create
    total = Orders::Total.new(item_params).calculate
    respond_to do |format|
      format.json do
        render json: { total: total }
      end
    end
  end

  private

  def item_params
    params.permit(items: [])['items'].try(:reject, &:blank?)
  end
end
