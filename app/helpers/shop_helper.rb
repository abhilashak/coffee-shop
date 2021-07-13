# frozen_string_literal: true

# Helper methods for shop lists
module ShopHelper
  # Item discount description
  def disc_desciption(item)
    "GET #{item.discount_percentage}% discount with #{item.discount_with_item&.name}"
  end

  # Item free description
  def free_description(item)
    "Free with #{item.free_with_item&.name}"
  end

  # Announcement icon
  def announcement_icon
    fa_icon 'bullhorn', class: 'me-1'
  end

  # Item Price info
  def price_info(item)
    "#{item.price} ($#{item.tax} tax)"
  end
end
