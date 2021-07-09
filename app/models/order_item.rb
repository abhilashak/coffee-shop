# frozen_string_literal: true

# Join model for orders and its items
class OrderItem < ApplicationRecord
  # Associations
  belongs_to :item, inverse_of: :order_item
  belongs_to :order, inverse_of: :order_item

  # Validations
  validates :item, presence: true
  validates :order, presence: true
end
