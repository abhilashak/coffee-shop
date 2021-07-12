# frozen_string_literal: true

# Join model for orders and its items
class Order < ApplicationRecord
  # Enum Store as hash by using rails cool helper methods
  STATUS = %w[pending completed].freeze
  enum status: STATUS.zip(STATUS).to_h

  # scopes
  default_scope { order('created_at DESC') }

  # Associations
  has_many :order_items
  has_many :items, through: :order_items

  # Validations
  validates :total, presence: true

  # Class methods
  def self.create_with_items(item_ids, total)
    order = create!(total: total) unless total.to_i.eql?(0)
    item_ids.each { |item_id| order.order_items.create!(item_id: item_id) }
    order
  end

  # Instance Methods
  def completed!
    update_column :status, 'completed'
  end
end
