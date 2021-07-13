# frozen_string_literal: true

require 'activerecord-import/active_record/adapters/mysql2_adapter'

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
    return if total.to_i.eql?(0)

    # create order data in db
    order = create!(total: total)
    # create order items data in db
    ord_itms = item_ids.map { |id| order.order_items.build(item_id: id) }
    OrderItem.import ord_itms

    order
  end

  # Instance Methods
  def completed!
    update_column :status, 'completed'
  end
end
