# frozen_string_literal: true

# Item object that maps to db item
class Item < ApplicationRecord
  # Associations
  has_many :orders, through: :order_items
  has_one  :free_with_item, class: :item
  has_one  :discount_with_item, class: :item

  # Validations
  validates :name, :price, :tax, presence: true
  validates :name, length: { minimum: 2, maximum: 60 }
  validates :category, length: { maximum: 50 }
  validates :discount_percentage, presence: true,
                                  if: proc { |item| item.discount_with_item.present? }
end
