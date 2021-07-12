# frozen_string_literal: true

# Handle the orders!
class OrdersController < ApplicationController
  def create
    respond_to do |format|
      format.json do
        render json: { success: true }
      end
    end
  end

  private

  def item_params
    params.permit(items: [])['items'].try(:reject, &:blank?)
  end
end
