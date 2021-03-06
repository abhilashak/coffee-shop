# frozen_string_literal: true

# Item object that maps to db item
class Item < ApplicationRecord
  # constants
  CATEGORIES = %w[beverage sandwich toast side coffee].freeze

  # scopes
  default_scope { order('created_at DESC') }
  scope :random, -> { order(Arel.sql('RAND()')).limit(1) }

  # Associations
  belongs_to  :free_with_item, class_name: 'Item',
                               foreign_key: 'free_with_item_id',
                               optional: true
  belongs_to  :discount_with_item, class_name: 'Item',
                                   foreign_key: 'discount_with_item_id',
                                   optional: true
  has_many :order_items
  has_many :orders, through: :order_items

  # Validations
  validates :name, :price, :tax, presence: true
  validates :name, length: { minimum: 2, maximum: 60 }
  validates :category, length: { maximum: 50 }
  validates :discount_percentage, presence: true,
                                  if: proc { discount_with_item_id.present? }

  # Instance Methods
  def free?
    free_with_item_id.present?
  end

  def discounted?
    discount_with_item_id.present?
  end

  # checks this item is free or discount with any other item
  def free_or_discounted?
    free? || discounted?
  end

  def cost
    price + tax
  end
end
