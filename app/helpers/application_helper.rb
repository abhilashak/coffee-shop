# frozen_string_literal: true

# helper module
module ApplicationHelper
  # Fetch bootstrap class for the flash message according to message type
  def bootstrap_class_for(flash_type)
    { success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info' }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  # Creates the flash message content
  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: 'alert') do
               concat content_tag(:button, 'x', class: 'close', data: { dismiss: 'alert' })
               concat message.try(:html_safe)
             end)
    end
    nil
  end
end
