module ApplicationHelper
  def flash_message(error_class: 'error_flash_message', notice_class: 'notice_flash_message')
    css_class = flash_type == 'notice' ? notice_class : error_class
    content_tag(:div, Array(flash_messages.first).join('<br/>').html_safe, {
      class: css_class,
      style: (
      if request.flash.any?
        'display: block;'
      else
        'display: none;'
      end)
    })
  end

  def flash_type
    @flash_type ||= request.flash.to_hash.keep_if { |_, val| val.present? }.keys.first
  end

  def flash_prefix
    if flash_messages.first.is_a?(Array)
      flash_messages.first.shift
    elsif flash_type == 'notice'
      'Alright!'
    else
      'Hold up!'
    end
  end

  #
  # Private
  #

  def flash_messages
    @flash_messages ||= request.flash.discard.collect { |_, msg| msg }
  end
end
