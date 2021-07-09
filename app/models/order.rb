# frozen_string_literal: true

# Join model for orders and its items
class Order < ApplicationRecord
  # Associations
  has_many :items, through: :order_items

  # Validations
  validates :total, presence: true
end
