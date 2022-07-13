# frozen_string_literal: true

module ApplicationHelper
  def login_helper(style = '')
    if current_user.is_a?(GuestUser)
      (link_to 'Register', new_user_registration_path, class: style) +
        ' '.html_safe +
        (link_to 'Login', new_user_session_path, class: style)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper
    content_tag(:p, greeting_message, class: 'source-greeting') if session[:source]
  end

  def copyright_helper
    name = 'Funes Nicolas'
    msg = 'All rights reserved'
    sanitize "&copy; #{Time.zone.now.year} | <b>#{name}</b> #{msg}"
  end

  private

  def greeting_message
    "Thanks for visiting me from #{session[:source]}"
  end
end
